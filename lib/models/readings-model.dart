import 'package:flutter/material.dart';

class ReadingsModel {
  int id;
  DateTime dateOfReading;
  TimeOfDay timeOfReading;
  ReadingType readingType;
  double value;

}

enum ReadingType {
  EC,
  pH
}