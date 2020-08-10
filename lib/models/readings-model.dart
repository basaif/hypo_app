

class ReadingsModel {
  int id;
  DateTime dateOfReading;
  ReadingType readingType;
  double value;

  ReadingsModel({this.id, this.dateOfReading,
      this.readingType, this.value});

  static bool getReadings(){
    //TODO: implement getReadings
    return true;
  }

}

enum ReadingType {
  EC,
  pH
}