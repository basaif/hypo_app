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

import 'package:hypoapp/global-data.dart' as appState;


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
                                Content(),
                              ]))));
                }))));
  }
}

class Content extends StatefulWidget {
  @override
  ContentState createState() {
    return ContentState();
  }
}

class ContentState extends State<Content> {
  @override
  void initState() {
    super.initState();
    //TODO: implement the initial state of ContentState
  }

  @override
  Widget build(BuildContext context) {
    return appState.isGrowing ? ActiveHomeContent() : FirstTimeHomeContent();
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
  List<charts.Series<ReadingsModel, DateTime>> seriesList =
      List<charts.Series<ReadingsModel, DateTime>>();

  List<charts.Series<ReadingsModel, DateTime>> activeSeriesList =
      List<charts.Series<ReadingsModel, DateTime>>();
  void populateSeriesList() {
    seriesList.add(
      new charts.Series<ReadingsModel, DateTime>(
        id: 'pH',
        data: tray.getTypeBasedData(ReadingType.pH),
        //x axis
        domainFn: (ReadingsModel readings, _) => readings.dateOfReading,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        //y axis
        measureFn: (ReadingsModel readings, _) => readings.value,
      ),
    );

    seriesList.add(
      new charts.Series<ReadingsModel, DateTime>(
        id: 'EC',
        data: tray.getTypeBasedData(ReadingType.EC),
        //x axis
        domainFn: (ReadingsModel readings, _) => readings.dateOfReading,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        //y axis
        measureFn: (ReadingsModel readings, _) => readings.value,
      ),
    );
  }

  bool isEcButtonActive;
  bool isPhButtonActive;

  bool isSixHButtonActive;
  bool isTwelveHButtonActive;
  bool isDayButtonActive;
  bool isWeekButtonActive;

  DateTime startDate;
  DateTime endDate;

  DateTime lastReading;

  void initState() {
    super.initState();

    lastReading = tray.growingData[tray.growingData.length - 1].dateOfReading;

    isEcButtonActive = false;
    isPhButtonActive = true;

    isSixHButtonActive = true;
    isTwelveHButtonActive = false;
    isDayButtonActive = false;
    isWeekButtonActive = false;

    populateSeriesList();
    activeSeriesList = seriesList.sublist(0, 1);
    startDate = lastReading.subtract(Duration(hours: 6));
    endDate = lastReading;
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

    return Container(
        child: Padding(
            padding: EdgeInsets.all(2),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                            child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 5, top: 5),
                                        child: Text(
                                          tray.growingPlant.groupName,
                                          style: AppTextStyles.bodyHeadlines,
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 2),
                                        child: Text(
                                          AppStrings.startDate +
                                              tray.startDate.day.toString() +
                                              "-" +
                                              tray.startDate.month.toString() +
                                              "-" +
                                              tray.startDate.year.toString(),
                                          style: AppTextStyles.bodyText,
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 2),
                                        child: Text(
                                          AppStrings.daysPassed +
                                              (DateTime.now().difference(
                                                      tray.startDate))
                                                  .inDays
                                                  .toString(),
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
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              setState(() {
                                activeSeriesList = seriesList.sublist(0, 1);
                                isPhButtonActive = true;
                                isEcButtonActive = false;
                              });
                            },
                            child: Text(
                              AppStrings.ph,
                              style: isPhButtonActive
                                  ? AppTextStyles.highlightedBodyText
                                  : AppTextStyles.nonHighlightedBodyText,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side:
                                    BorderSide(color: ColorSets.primaryGreen)),
                            color: isPhButtonActive
                                ? ColorSets.primaryGreen
                                : ColorSets.white,
                            elevation: 0,
                          ),
                          RaisedButton(
                            onPressed: () {
                              setState(() {
                                activeSeriesList = seriesList.sublist(1, 2);
                                isPhButtonActive = false;
                                isEcButtonActive = true;
                              });
                            },
                            child: Text(
                              AppStrings.ec,
                              style: isEcButtonActive
                                  ? AppTextStyles.highlightedBodyText
                                  : AppTextStyles.nonHighlightedBodyText,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side:
                                    BorderSide(color: ColorSets.primaryGreen)),
                            color: isEcButtonActive
                                ? ColorSets.primaryGreen
                                : ColorSets.white,
                            elevation: 0,
                          ),
                        ],
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(Size(320, 270)),
                        child: charts.TimeSeriesChart(
                          activeSeriesList,
                          animate: false,

                          domainAxis: new charts.DateTimeAxisSpec(
                              // Set the initial viewport by providing a new AxisSpec with the
                              // desired viewport, in NumericExtents.
                              viewport: new charts.DateTimeExtents(
                                  start: startDate, end: endDate)),

                          // Optionally add a pan or pan and zoom behavior.
                          // If pan/zoom is not added, the viewport specified remains the viewport.
                          behaviors: [new charts.PanBehavior()],
                        ),
                      )
                    ],
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ButtonTheme(
                          minWidth: 80,
                          padding: EdgeInsetsDirectional.only(start: 0, end: 0),
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                isSixHButtonActive = true;
                                isTwelveHButtonActive = false;
                                isDayButtonActive = false;
                                isWeekButtonActive = false;

                                startDate =
                                    lastReading.subtract(Duration(hours: 6));
                              });
                            },
                            child: Text(
                              AppStrings.sixHours,
                              style: isSixHButtonActive
                                  ? AppTextStyles.highlightedBodyText
                                  : AppTextStyles.nonHighlightedBodyText,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    bottomLeft: Radius.circular(50)),
                                side:
                                    BorderSide(color: ColorSets.primaryGreen)),
                            color: isSixHButtonActive
                                ? ColorSets.primaryGreen
                                : ColorSets.white,
                            elevation: 0,
                          )),
                      ButtonTheme(
                          minWidth: 80,
                          padding: EdgeInsetsDirectional.only(start: 0, end: 0),
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                isSixHButtonActive = false;
                                isTwelveHButtonActive = true;
                                isDayButtonActive = false;
                                isWeekButtonActive = false;

                                startDate =
                                    lastReading.subtract(Duration(hours: 12));
                              });
                            },
                            child: Text(
                              AppStrings.twelveHours,
                              style: isTwelveHButtonActive
                                  ? AppTextStyles.highlightedBodyText
                                  : AppTextStyles.nonHighlightedBodyText,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.zero, right: Radius.zero),
                                side:
                                    BorderSide(color: ColorSets.primaryGreen)),
                            color: isTwelveHButtonActive
                                ? ColorSets.primaryGreen
                                : ColorSets.white,
                            elevation: 0,
                          )),
                      ButtonTheme(
                          minWidth: 80,
                          padding: EdgeInsetsDirectional.only(start: 0, end: 0),
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                isSixHButtonActive = false;
                                isTwelveHButtonActive = false;
                                isDayButtonActive = true;
                                isWeekButtonActive = false;

                                startDate =
                                    lastReading.subtract(Duration(days: 1));
                              });
                            },
                            child: Text(
                              AppStrings.day,
                              style: isDayButtonActive
                                  ? AppTextStyles.highlightedBodyText
                                  : AppTextStyles.nonHighlightedBodyText,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.zero, right: Radius.zero),
                                side:
                                    BorderSide(color: ColorSets.primaryGreen)),
                            color: isDayButtonActive
                                ? ColorSets.primaryGreen
                                : ColorSets.white,
                            elevation: 0,
                          )),
                      ButtonTheme(
                          minWidth: 80,
                          padding: EdgeInsetsDirectional.only(start: 0, end: 0),
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                isSixHButtonActive = false;
                                isTwelveHButtonActive = false;
                                isDayButtonActive = false;
                                isWeekButtonActive = true;

                                startDate =
                                    lastReading.subtract(Duration(days: 7));
                              });
                            },
                            child: Text(
                              AppStrings.week,
                              style: isWeekButtonActive
                                  ? AppTextStyles.highlightedBodyText
                                  : AppTextStyles.nonHighlightedBodyText,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    bottomRight: Radius.circular(50)),
                                side:
                                    BorderSide(color: ColorSets.primaryGreen)),
                            color: isWeekButtonActive
                                ? ColorSets.primaryGreen
                                : ColorSets.white,
                            elevation: 0,
                          )),
                    ],
                  ),
                ])));
  }
}

class FirstTimeHomeContent extends StatefulWidget {
  @override
  FirstTimeHomeContentState createState() {
    return FirstTimeHomeContentState();
  }
}

class FirstTimeHomeContentState extends State<FirstTimeHomeContent> {
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
                    if (PlantModel.getAvailablePlants()){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChoosePlantsPage()));
                    }
                    else{
                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text(AppStrings.generalError), duration: Duration(seconds: 3),)
                      );
                    }


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
