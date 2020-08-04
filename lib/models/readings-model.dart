

class ReadingsModel {
  int id;
  DateTime dateOfReading;
  ReadingType readingType;
  double value;

  ReadingsModel({this.id, this.dateOfReading,
      this.readingType, this.value});


}

enum ReadingType {
  EC,
  pH
}