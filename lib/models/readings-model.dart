import 'package:flutter/material.dart';

class ReadingsModel {
  int id;
  DateTime dateOfReading;
  TimeOfDay timeOfReading;
  ReadingType readingType;
  double value;

  ReadingsModel({this.id, this.dateOfReading, this.timeOfReading,
      this.readingType, this.value});


}

enum ReadingType {
  EC,
  pH
}