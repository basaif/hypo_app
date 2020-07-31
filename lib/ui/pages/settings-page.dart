import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/app/strings.dart';
import 'package:hypoapp/app/textStyles.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorSets.lightGrey,
        child: Container(
            color: ColorSets.lightGrey,
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
                                //TODO add the real settings widgets
                                SettingsContent(),
                              ])));
                }))));
  }
}

class SettingsContent extends StatefulWidget {
  @override
  SettingsContentState createState() {
    return SettingsContentState();
  }
}

class SettingsContentState extends State<SettingsContent> {

  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            color: ColorSets.white,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    //TODO english button action

                  },
                  child: Text(
                    AppStrings.english,
                    style: AppTextStyles.languageOptions,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //TODO arabic button action

                  },
                  child: Text(
                    AppStrings.arabic,
                    style: AppTextStyles.languageOptions,
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    bool notificationsOn = true;

    return Container(
      child: Column(
        children: <Widget>[
          Card(
              margin: EdgeInsets.only(bottom: 1, top: 0),
              child: ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: ColorSets.primaryGreen,
                ),
                title: Text(
                  AppStrings.account,
                  style: AppTextStyles.bodyHeadlines,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorSets.primaryGreen,
                ),
                onTap: () {
                  //TODO edit account list tile action
                },
              )),
          Card(
              margin: EdgeInsets.only(bottom: 1, top: 0),
              child: ListTile(
                leading: Icon(
                  Icons.language,
                  color: ColorSets.primaryGreen,
                ),
                title: Text(
                  AppStrings.language,
                  style: AppTextStyles.bodyHeadlines,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorSets.primaryGreen,

                ),
                onTap: () =>  displayBottomSheet(context),
              )),
          Card(
              margin: EdgeInsets.only(bottom: 1, top: 0),
              child: SwitchListTile(
                value: notificationsOn,
                secondary: Icon(
                  Icons.notifications,
                  color: ColorSets.primaryGreen,
                ),
                title: Text(
                  AppStrings.pushNotifications,
                  style: AppTextStyles.bodyHeadlines,
                ),
                onChanged: (value) {
                  //TODO notifications switch action
                  setState(() {
                    notificationsOn = value;
                  });
                },
              )),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Card(
              margin: EdgeInsets.only(bottom: 1, top: 0),
              child: ListTile(
                leading: Icon(
                  Icons.help,
                  color: ColorSets.primaryGreen,
                ),
                title: Text(
                  AppStrings.help,
                  style: AppTextStyles.bodyHeadlines,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorSets.primaryGreen,
                ),
                onTap: () {
                  //TODO help list tile action
                },
              )),
          Card(
              margin: EdgeInsets.only(bottom: 1, top: 0),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: ColorSets.primaryGreen,
                ),
                title: Text(
                  AppStrings.about,
                  style: AppTextStyles.bodyHeadlines,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorSets.primaryGreen,
                ),
                onTap: () {
                  //TODO about list tile action
                },
              )),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Card(
              margin: EdgeInsets.only(bottom: 1, top: 0),
              child: ListTile(
                leading: Icon(
                  Icons.close,
                  color: ColorSets.primaryGreen,
                ),
                title: Text(
                  AppStrings.logout,
                  style: AppTextStyles.bodyHeadlines,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorSets.primaryGreen,
                ),
                onTap: () {
                  //TODO logout list tile action
                },
              )),
        ],
      ),
    );
  }
}
