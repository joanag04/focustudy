import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_flutter/components/timer_service.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final seconds = provider.currentDuration % 60;
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Text(
          provider.currentState,
          style: TextStyle(
              color: Color.fromARGB(255, 40, 96, 207),
              fontSize: 50,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width / 3.2,
                height: 170,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 121, 169, 191),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    (provider.currentDuration ~/ 60).toString(),
                    style: TextStyle(color: Colors.white, fontSize: 100),
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            Text(':',
                style: TextStyle(
                    color: Color.fromARGB(255, 121, 169, 191), fontSize: 60)),
            SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 121, 169, 191),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  seconds == 0 ? "${seconds}0" : seconds.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 100),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
