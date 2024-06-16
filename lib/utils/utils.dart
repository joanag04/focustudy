import 'package:flutter/material.dart';

List selectableTimes = [
  "10",
  "300",
  "600",
  "900",
  "1200",
  "1500",
  "1800",
  "2100",
  "2400",
  "2700",
  "3000",
  "3300"
];

// changing the color of the background when timer is in timer
Color renderColor(String currentState) {
  if (currentState == "FOCUS") {
    return Colors.white;
  } else {
    return Color.fromARGB(255, 193, 227, 248);
  }
}
