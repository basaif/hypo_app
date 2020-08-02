import 'dart:math';

import 'package:flutter/material.dart';

import 'models/readings-model.dart';

 class FakeData {
   static double roundDouble(double value, int places){
     double mod = pow(10.0, places);
     return ((value * mod).round().toDouble() / mod);
   }

 static List<ReadingsModel> populateReadings(List<ReadingsModel> readings) {

    DateTime date = DateTime(2020, 6, 1);
    Random random = Random(3);
    for(int i = 0; i < 62; i++){

      for(int j = 0; j < 24; j++){
        readings.add(ReadingsModel(
            id: i*j,
            dateOfReading: date,
            timeOfReading: TimeOfDay(hour: j, minute: 0),
            readingType: ReadingType.EC,
            value: roundDouble((random.nextDouble() * 10.0), 1)
        ));
        readings.add(ReadingsModel(
            id: i+j,
            dateOfReading: date,
            timeOfReading: TimeOfDay(hour: j, minute: 0),
            readingType: ReadingType.pH,
            value: roundDouble((random.nextDouble() * 10.0), 1)
        ));

      }
      date = date.add(Duration(days: 1));

    }

    return readings;

  }

  FakeData();

}