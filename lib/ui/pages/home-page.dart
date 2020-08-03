import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/app/images.dart';
import 'package:hypoapp/app/strings.dart';
import 'package:hypoapp/app/textStyles.dart';
import 'package:hypoapp/fake-data.dart';
import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/models/readings-model.dart';
import 'package:hypoapp/models/tray-model.dart';
import 'package:hypoapp/ui/pages/choose-plants-page.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorSets.lightGrey,
        child: Container(
            color: ColorSets.white,
            margin: const EdgeInsets.all(10.0),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight,
                          ),
                          child: Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                //TODO add the real home widgets
                                ActiveHomeContent(),
                              ]))));
                }))));
  }
}

class ActiveHomeContent extends StatefulWidget {
  @override
  ActiveHomeContentState createState() {
    return ActiveHomeContentState();
  }
}

class ActiveHomeContentState extends State<ActiveHomeContent> {
  //TODO get real tray data

  static List<ReadingsModel> readings = List<ReadingsModel>();

  final TrayModel tray = TrayModel(
    id: 1,
    startDate: DateTime(2020, 6, 1),
    growingPlant: PlantModel(
        1,
        "Leafy Vegetables",
        "Salads, artichoke, basil, lettuce and other herbs",
        AppImages.vegeiesIcon),
    growingData: FakeData.populateReadings(readings),
  );

//  Widget _getListItemTile(BuildContext context, int index) {
//    return Container(
//      margin: EdgeInsets.symmetric(vertical: 4),
//      child: Card(
//        child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    Text("Date: "+ tray.growingData[index].dateOfReading.toString(), style: AppTextStyles.bodyHeadlines),
//                    Text("Time: "+ tray.growingData[index].timeOfReading.toString(), style: AppTextStyles.bodyHeadlines),
//                    Text("Type: "+ tray.growingData[index].readingType.toString(), style: AppTextStyles.bodyHeadlines),
//                    Text("Value: "+ tray.growingData[index].value.toString(), style: AppTextStyles.bodyHeadlines),
//                  ],
//                ))
//            );
//  }
  List<charts.Series<ReadingsModel, DateTime>> seriesList = List<charts.Series<ReadingsModel, DateTime>>();
  void populateSeriesList(){

    seriesList.add(new
    charts.Series<ReadingsModel, DateTime>(
        id: 'Growth',
        data: tray.getTypeBasedData(ReadingType.pH),
        //x axis
        domainFn: (ReadingsModel readings, _) => readings.dateOfReading,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        //y axis
        measureFn: (ReadingsModel readings, _) => readings.value,),

    );

    seriesList.add(new
    charts.Series<ReadingsModel, DateTime>(
      id: 'Growth',
      data: tray.getTypeBasedData(ReadingType.EC),
      //x axis
      domainFn: (ReadingsModel readings, _) => readings.dateOfReading,
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      //y axis
      measureFn: (ReadingsModel readings, _) => readings.value,),

    );
  }
  @override
  Widget build(BuildContext context) {
//    return SingleChildScrollView(
//      physics: ScrollPhysics(),
//      child:
//      Column(
//          children: <Widget>[
//      ListView.builder(
//      physics: NeverScrollableScrollPhysics(),
//      itemBuilder: _getListItemTile,
//      itemCount: tray.growingData.length,
//      shrinkWrap: true,
//
//    )],));

    populateSeriesList();
    return Container(
        child: Padding(
            padding: EdgeInsets.all(2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start ,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.only(bottom: 30),
                    elevation: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Image.asset(
                              tray.growingPlant.imageLocation,
                              height: 100.0,
                            )),
                        Flexible(
                          fit: FlexFit.loose,
                          child:Padding(padding: EdgeInsets.all(20), child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(bottom: 5 , top: 5),
                                child: Text(
                                  tray.growingPlant.groupName,
                                  style: AppTextStyles.bodyHeadlines,
                                )),
                            Padding(
                                padding: EdgeInsets.only(bottom: 2),
                                child: Text(
                                  AppStrings.startDate +
                                      tray.startDate.day.toString()+"-"+tray.startDate.month.toString()+"-"+tray.startDate.year.toString(),
                                  style: AppTextStyles.bodyText,
                                )),
                            Padding(
                                padding: EdgeInsets.only(bottom: 2),
                                child: Text(
                                  AppStrings.daysPassed +
                                      (DateTime.now()
                                              .difference(tray.startDate))
                                          .inDays.toString(),
                                  style: AppTextStyles.bodyText,
                                )),
                            Padding(
                              padding: EdgeInsets.all(0),
                              child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  AppStrings.endCycle,
                                  style: AppTextStyles.links,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ],
                        ))),
                      ],
                    ),
                  ),
                  Card(
                    child:
                    ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(320, 270)),
                        child: charts.TimeSeriesChart(
                          seriesList,
                          animate: true,
                        ),


                  )),
                ])));
  }
}

class FirstTimeHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              AppStrings.noGrowingCycleMessage,
              style: AppTextStyles.bodyHeadlines,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ButtonTheme(
                minWidth: 200.0,
                height: 70.0,
                child: RaisedButton(
                  padding: EdgeInsets.all(20.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChoosePlantsPage()),
                    );
                  },
                  child: Text(
                    AppStrings.startGrowing,
                    style: AppTextStyles.buttons,
                  ),
                  color: ColorSets.primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
