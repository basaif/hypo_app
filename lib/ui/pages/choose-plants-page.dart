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
          ),
        ),
        body: Container(
            color: ColorSets.lightGrey,
            child: Container(
                color: ColorSets.white,
                margin: const EdgeInsets.all(10.0),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: LayoutBuilder(builder: (BuildContext context,
                        BoxConstraints viewportConstraints) {
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
                    })))), );
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
  List<ListItem<PlantModel>> list = List<ListItem<PlantModel>>();


  void initState() {
    super.initState();
    initializePlants();
    createList();
  }

  void initializePlants() {
    plants.add(PlantModel(
        1,
        "Leafy Vegetables",
        "Salads, artichoke, basil, lettuce and other herbs",
        AppImages.vegeiesIcon));
    plants.add(PlantModel(2, "Fruit", "Tomatoes, peppers and strawberries",
        AppImages.fruitsIcon));
    plants.add(PlantModel(
        3, "Other", "Cucumber, sweet corn and endives ", AppImages.otherIcon));

    plants.add(PlantModel(
        3, "Other", "Cucumber, sweet corn and endives ", AppImages.otherIcon));
    plants.add(PlantModel(
        3, "Other", "Cucumber, sweet corn and endives ", AppImages.otherIcon));
    plants.add(PlantModel(
        3, "Other", "Cucumber, sweet corn and endives ", AppImages.otherIcon));

  }

  void createList() {
    plants.forEach((plant) {
      list.add(ListItem<PlantModel>(plant));
    });
  }


  Widget _getListItemTile(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
      setState(() {
        if (list.any((item) => item.isSelected)) {
          list[index].isSelected = false;
        }
        else {
          list[index].isSelected = true;
        }
      });

      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        color: list[index].isSelected ? ColorSets.primaryGreen : ColorSets.white,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                list[index].data.imageLocation,
                height: 100.0,
              ),
            Flexible(
              fit: FlexFit.loose,
              child:Padding(padding: EdgeInsets.all(20), child:Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(list[index].data.groupName, style: AppTextStyles.bodyHeadlines),
                  Text(
                    list[index].data.description,
                    style: AppTextStyles.bodyText,
                    overflow: TextOverflow.clip,
                  ),
                ],
              ))
            )],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
    Column(
      children: <Widget>[
        ListView.builder(

          itemBuilder: _getListItemTile,
          itemCount: list.length,
          shrinkWrap: true,

        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
            child:ButtonTheme(
          minWidth: 200.0,
          height: 70.0,
          child: RaisedButton(
            padding: EdgeInsets.all(20.0),
            onPressed: () {
                //TODO write the real logic of the confirm button
            },
            child: Text(
              AppStrings.confirm,
              style: AppTextStyles.buttons,
            ),
            color: list.any((item) => item.isSelected) ? ColorSets.primaryGreen : ColorSets.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        ))
      ],
    );
  }
}

class ListItem<T> {
  bool isSelected = false; //Selection property to highlight or not
  T data; //Data of the user
  ListItem(this.data); //Constructor to assign the data
}
