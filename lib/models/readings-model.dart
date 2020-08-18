

class ReadingsModel {
  int id;
  DateTime dateOfReading;
  ReadingType readingType;
  double value;

  ReadingsModel({this.id, this.dateOfReading,
      this.readingType, this.value});

  factory ReadingsModel.fromJson(Map<String, dynamic> json) {
    return ReadingsModel(
      id: json['id'] as int,
      dateOfReading: json['dateOfReading'] as DateTime,
      readingType: json['readingType'] as ReadingType,
      value: json['value'] as double,
    );
  }

  static bool getReadings(){
    //TODO: implement getReadings
    return true;
  }

}

enum ReadingType {
  EC,
  pH

}