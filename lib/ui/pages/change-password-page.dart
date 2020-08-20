import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/app/strings.dart';
import 'package:hypoapp/app/textStyles.dart';
import 'package:hypoapp/models/user-model.dart';
import 'package:hypoapp/resources/validators.dart';

class ChangePasswordPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.changePassword,
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
                                    ChangePasswordForm(),
                                  ])));
                    })))));
  }
}

class ChangePasswordForm extends StatefulWidget {
  @override
  ChangePasswordFormState createState() {
    return ChangePasswordFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ChangePasswordFormState extends State<ChangePasswordForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  UserModel user = UserModel.currentUser;

  String password;
  String newPassword;


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column( children: <Widget>[
      Padding(padding: EdgeInsets.only(bottom: 20),
        child: Text(AppStrings.changePassword, style: AppTextStyles.bodyHeadlines,),),
      Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Add TextFormFields and RaisedButton here.
                TextFormField(
                  keyboardType: TextInputType.text,
                  // The validator receives the text that the user has entered.
                  decoration: InputDecoration(
                    labelText: AppStrings.password,
                    labelStyle: AppTextStyles.hintText,
                  ),
                  obscureText: true,

                  validator: (value) {
                    if (value.isEmpty) {
                      return AppStrings.passwordEmpty;
                    }
                    else if(value != user.password){
                      return AppStrings.passwordError;
                    }
                    return null;
                  },
                ),

                TextFormField(
                  keyboardType: TextInputType.text,
                  // The validator receives the text that the user has entered.
                  decoration: InputDecoration(
                    labelText: AppStrings.newPassword,
                    labelStyle: AppTextStyles.hintText,
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppStrings.newPasswordEmpty;
                    }
                    else{
                      newPassword = value;
                    }
                    return null;
                  },
                ),

                TextFormField(
                  keyboardType: TextInputType.text,
                  // The validator receives the text that the user has entered.
                  decoration: InputDecoration(
                    labelText: AppStrings.confirmPassword,
                    labelStyle: AppTextStyles.hintText,
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return AppStrings.confirmedPasswordEmpty;
                    }
                    else if (!Validator.confirmPassword(newPassword, value)){
                      return AppStrings.confirmPasswordError;
                    }
                    else{
                      newPassword = value;
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
                        onPressed: () async{
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState.validate()) {
                            bool canChangePassword = await UserModel.changePassword(newPassword);
                            if(canChangePassword){
                              Navigator.of(context).pop();
                            }
                            else{
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text(AppStrings.generalError), duration: Duration(seconds: 3),)
                              );
                            }
                          }
                        },
                        child: Text(
                          AppStrings.saveChanges,
                          style: AppTextStyles.buttons,
                        ),
                        color: ColorSets.primaryGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    )),


              ]))]);
  }
}