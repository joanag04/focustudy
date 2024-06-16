import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool timerPlaying = false;
  int rounds = 0;
  String currentState = "FOCUS";

  // function to start the timer
  void start() {
    timerPlaying = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        handleNextRound();
      } else {
        currentDuration--;
        notifyListeners();
      }
    });
  }

  // function to pause the timer
  void pause() {
    timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  // functions for the rounds of the timer
  void handleNextRound() {
    if (currentState == "FOCUS" && rounds != 3) {
      currentState = "BREAK";
      currentDuration = 300;
      selectedTime = 300;
      rounds++;
      // normal break (5 mins)
    } else if (currentState == "BREAK") {
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
      // long break before the last round
    } else if (currentState == "FOCUS" && rounds == 3) {
      currentState = "LONGBREAK";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds++;
      // what happens after the long break
    } else if (currentState == "LONGBREAK") {
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;
    }
    notifyListeners();
  }

  // reset the timer
  void reset() {
    timer.cancel();
    currentState = "FOCUS";
    currentDuration = 1500;
    selectedTime = 1500;
    rounds = 0;
    timerPlaying = false;
    notifyListeners();
  }
}
