import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:teste_flutter/utils/event.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Map<DateTime, List<Event>> selectedEvents = {};

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController eventController = TextEditingController();

  List<Event> getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 121, 169, 191),
        title: const Text("CALENDÁRIO"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Add Event',
              style: TextStyle(color: Color.fromARGB(255, 121, 169, 191)),
            ),
            content: TextField(
              controller: eventController,
            ),
            actions: [
              TextButton(
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Color.fromARGB(255, 121, 169, 191)),
                ),
                onPressed: () {
                  if (eventController.text.isEmpty) {
                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay]!
                          .add(Event(title: eventController.text));
                    } else {
                      selectedEvents[selectedDay] = [
                        Event(title: eventController.text)
                      ];
                    }
                  }
                  Navigator.pop(context);
                  eventController.clear();
                  setState(() {});
                  return;
                },
              )
            ],
          ),
        ),
        label: const Text(
          'Add event',
          style: TextStyle(color: Color.fromARGB(255, 121, 169, 191)),
        ),
        icon: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 121, 169, 191),
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: focusedDay,
            firstDay: DateTime(2024, 01, 01),
            lastDay: DateTime(2024, 12, 31),
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
            },
            calendarStyle: const CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 121, 169, 191),
                  shape: BoxShape.circle),
            ),
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            eventLoader: getEventsfromDay,
          ),
          const SizedBox(
            height: 45,
          ),
          ...getEventsfromDay(selectedDay).map(
            (Event event) => Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 50,
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      event.title,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                color: Color.fromARGB(255, 121, 169, 191),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
