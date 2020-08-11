import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/app/strings.dart';
import 'package:hypoapp/app/textStyles.dart';
import 'package:hypoapp/models/user-model.dart';
import 'package:hypoapp/ui/pages/app-skeleton-page.dart';
import 'package:hypoapp/ui/widgets/app-widgets.dart';

import '../../app-state.dart';

class RegisterDevicePage extends StatelessWidget {
  final String email;
  RegisterDevicePage({Key key, @required this.email}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.registerDevicePage,
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
                                    LogoWidget(),
                                    RegisterDeviceForm(email),
                                  ])));
                    })))));
  }
}

class RegisterDeviceForm extends StatefulWidget {
  final String email;
  RegisterDeviceForm(this.email);
  @override
  RegisterDeviceFormState createState() {
    return RegisterDeviceFormState(email);
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class RegisterDeviceFormState extends State<RegisterDeviceForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  String email;
  String deviceCode;

  RegisterDeviceFormState(this.email);

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Add TextFormFields and RaisedButton here.
              TextFormField(
                keyboardType: TextInputType.number,
                // The validator receives the text that the user has entered.
                decoration: InputDecoration(
                  labelText: AppStrings.deviceCode,
                  labelStyle: AppTextStyles.hintText,
                ),

                style: AppTextStyles.inputText,

                validator: (value) {
                  if (value.isEmpty) {
                    return AppStrings.deviceCodeEmpty;
                  }
                  else{
                    deviceCode = value;
                  }
                  return null;
                },
              ),

              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    height: 70.0,
                    child: RaisedButton(
                      padding: EdgeInsets.all(20.0),
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState.validate()) {
                          if (UserModel.registerDevice(email, deviceCode)){
                            AppState.setStateLogged(true);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => AppSkeleton()),
                            );

                          }
                          else{
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text(AppStrings.generalError), duration: Duration(seconds: 3),)
                            );
                          }
                        }
                      },
                      child: Text(
                        AppStrings.confirm,
                        style: AppTextStyles.buttons,
                      ),
                      color: ColorSets.primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ))
            ]));
  }
}