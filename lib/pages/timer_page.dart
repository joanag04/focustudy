import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_flutter/components/progress_widget.dart';
import 'package:teste_flutter/components/time_controller.dart';
import 'package:teste_flutter/components/timer_card.dart';
import 'package:teste_flutter/components/timer_options.dart';
import 'package:teste_flutter/components/timer_service.dart';
import 'package:teste_flutter/utils/utils.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 121, 169, 191),
        title: const Text(
          'POMOTIMER',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () => provider.reset(),
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 15),
              TimerCard(),
              SizedBox(
                height: 40,
              ),
              TimerOptions(),
              const SizedBox(
                height: 40,
              ),
              TimeController(),
              const SizedBox(
                height: 40,
              ),
              ProgressWidget(),
              const SizedBox(
                height: 60,
              ),
              Container(
                color: const Color.fromARGB(255, 121, 169, 191),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: const Center(
                  child: Text(
                    'FOCUSTUDY - Organize e melhore seus estudos!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
