import 'package:flutter/material.dart';

class ReadingsModel {
  DateTime dateOfReading;
  TimeOfDay timeOfReading;
  ReadingType readingType;
  double value;

}

enum ReadingType {
  EC,
  pH
}