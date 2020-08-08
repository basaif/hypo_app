import 'dart:math';

import 'models/readings-model.dart';

 class FakeData {
   static double roundDouble(double value, int places){
     double mod = pow(10.0, places);
     return ((value * mod).round().toDouble() / mod);
   }

 static List<ReadingsModel> populateReadings(List<ReadingsModel> readings) {

    DateTime date = DateTime(2020, 6, 1);
    Random random = Random(3);
    for(int i = 0; i < 65; i++){

      for(int j = 0; j < 24; j++){
        readings.add(ReadingsModel(
            id: i*j,
            dateOfReading: date,
            readingType: ReadingType.EC,
            value: roundDouble((random.nextDouble() * 2.0), 1)
        ));
        readings.add(ReadingsModel(
            id: i+j,
            dateOfReading: date,
            readingType: ReadingType.pH,
            value: roundDouble((random.nextDouble() * 2.0), 1)
        ));
        date = date.add(Duration(hours: 1));
      }


    }

    return readings;

  }

  FakeData();

}