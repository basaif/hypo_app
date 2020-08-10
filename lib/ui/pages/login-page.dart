import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/app/strings.dart';
import 'package:hypoapp/app/textStyles.dart';
import 'package:hypoapp/models/user-model.dart';
import 'package:hypoapp/resources/validators.dart';
import 'package:hypoapp/ui/pages/app-skeleton-page.dart';
import 'package:hypoapp/ui/pages/recover-password-page.dart';
import 'package:hypoapp/ui/pages/sign-up-page.dart';
import 'package:hypoapp/ui/widgets/app-widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
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
                                    LogoWidget(),
                                    LoginForm(),
                                    LoginLinks(),
                                  ])));
                    }))));
  }
}

class LoginLinks extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecoverPasswordPage()),
                );
              },
              child: Text(
                AppStrings.forgotPassword,
                style: AppTextStyles.links,
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text(
                AppStrings.newSignUp,
                style: AppTextStyles.links,
              ),
            ),
          ],
        ));
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;

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
                keyboardType: TextInputType.emailAddress,
                // The validator receives the text that the user has entered.
                decoration: InputDecoration(
                  labelText: AppStrings.email,
                  labelStyle: AppTextStyles.hintText,
                ),

                style: AppTextStyles.inputText,

                validator: (value) {
                  bool isEmailCorrect = Validator.validateEmail(value);
                  if (!isEmailCorrect) {
                    return AppStrings.emailError;
                  }
                  else{
                    email = value;
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                // The validator receives the text that the user has entered.
                decoration: InputDecoration(
                  labelText: AppStrings.password,
                  labelStyle: AppTextStyles.hintText,
                ),

                //style: AppTextStyles.inputText,

                validator: (value) {
                  if (value.isEmpty) {
                    return AppStrings.passwordEmpty;
                  }
                  else{
                    password = value;
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
                            if (UserModel.login(email, password)){
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
                        AppStrings.login,
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
