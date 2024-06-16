import 'package:flutter/material.dart';
import 'package:teste_flutter/components/timer_service.dart';
import 'package:teste_flutter/utils/utils.dart';
import 'package:provider/provider.dart';

class TimerOptions extends StatelessWidget {
  TimerOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 155),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: selectableTimes.map((time) {
        return InkWell(
          onTap: () => provider.selectTime(double.parse(
              time)), // converting to double because time was string
          child: Container(
            margin: EdgeInsets.only(left: 10),
            width: 70,
            height: 50,
            decoration: int.parse(time) == provider.selectedTime
                ? BoxDecoration(
                    color: Color.fromARGB(255, 121, 169, 191),
                    borderRadius: BorderRadius.circular(5))
                : BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 121, 169, 191)),
                    borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                (int.parse(time) ~/ 60).toString(),
                style: TextStyle(
                    fontSize: 20,
                    color: int.parse(time) == provider.selectedTime
                        ? Colors.white
                        : Color.fromARGB(255, 121, 169, 191),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }).toList()),
    );
  }
}
