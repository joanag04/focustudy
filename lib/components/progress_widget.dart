import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_flutter/components/timer_service.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${provider.rounds}/4',
                style: TextStyle(
                    color: Color.fromARGB(255, 121, 169, 191),
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ROUND',
                style: TextStyle(
                    color: Color.fromARGB(255, 121, 169, 191),
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }
}
