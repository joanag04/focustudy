import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:teste_flutter/components/timer_service.dart';
import 'package:teste_flutter/pages/calendar_page.dart';
import 'package:teste_flutter/pages/login_page.dart';
import 'package:teste_flutter/pages/main_page.dart';
import 'package:teste_flutter/pages/subjects_page.dart';
import 'package:teste_flutter/pages/todo_page.dart';
import 'package:teste_flutter/pages/review_page.dart';
import 'package:teste_flutter/pages/timer_page.dart';

void main() async {
  // inicialize the hive
  await Hive.initFlutter();

  // open a box fot the todos
  var box = await Hive.openBox('mybox');

  runApp(ChangeNotifierProvider<TimerService>(
    create: (_) => TimerService(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(
        onTap: () {},
      ),
      routes: {
        '/loginpage': (context) => LoginPage(
              onTap: () {},
            ),
        '/mainpage': (context) => const MainPage(),
        '/todopage': (context) => const TodoPage(),
        '/timerpage': (context) => const TimerPage(),
        '/calendarpage': (context) => const CalendarPage(),
        '/reviewpage': (context) => ReviewPage(),
        '/subjectspage': (context) => SubjectsPage()
      },
    );
  }
}
