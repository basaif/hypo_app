import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/app/images.dart';
import 'package:hypoapp/app/strings.dart';
import 'package:hypoapp/app/textStyles.dart';
import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/ui/widgets/app-widgets.dart';

class ChoosePlantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.choosingPlantGroupPage,
            style: AppTextStyles.pageHeadlines,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: ColorSets.white),
            onPressed: () => Navigator.of(context).pop(),
          ), ),
        body:Container(
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
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    ChoosePlantContent(),
                                  ])));
                    })))));
  }
}

class ChoosePlantContent extends StatefulWidget {
  @override
  ChoosePlantContentState createState() {
    return ChoosePlantContentState();
  }
}

class ChoosePlantContentState extends State<ChoosePlantContent> {
  //TODO get the real plant list data
  List<PlantModel> plants = List<PlantModel>();

  List<Card> cards = List<Card>();

  void initState() {
    super.initState();
    initializePlants();
    createCards();
  }

  void initializePlants(){
    plants.add(PlantModel(1, "Leafy Vegetables", "Salads, artichoke, basil,\nlettuce and other herbs", AppImages.vegeiesIcon));
    plants.add(PlantModel(2, "Fruit", "Tomatoes,\npeppers and strawberries", AppImages.fruitsIcon));
    plants.add(PlantModel(3, "Other", "Cucumber,\nsweet corn and endives ", AppImages.otherIcon));
}

void createCards(){
  plants.forEach((plant) {
    cards.add(Card(

      child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(
            plant.imageLocation,
          height: 100.0,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(plant.groupName, style: AppTextStyles.bodyHeadlines),
             Text(plant.description, style: AppTextStyles.bodyText, maxLines: 3, softWrap: false, ),
          ],
        )
      ],),));
  }
  );
}


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          cards[0],
          cards[1],
          cards[2]
        ],
      )
    ,
    );
  }
}