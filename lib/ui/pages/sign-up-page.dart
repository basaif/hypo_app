import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/app/strings.dart';
import 'package:hypoapp/app/textStyles.dart';
import 'package:hypoapp/resources/validators.dart';
import 'package:hypoapp/ui/widgets/app-widgets.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.signUpPage,
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
                                    SignUpForm(),
                                  ])));
                    })))));
  }
}

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class SignUpFormState extends State<SignUpForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.

  final _formKey = GlobalKey<FormState>();

  String firstName;
  String lastName;
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
                keyboardType: TextInputType.text,
                // The validator receives the text that the user has entered.
                decoration: InputDecoration(
                  labelText: AppStrings.firstName,
                  labelStyle: AppTextStyles.hintText,
                ),

                style: AppTextStyles.inputText,

                validator: (value) {
                  if (value.isEmpty) {
                    return AppStrings.firstNameEmpty;
                  }
                  else{
                    firstName = value;
                  }
                  return null;
                },
              ),

              TextFormField(
                keyboardType: TextInputType.text,
                // The validator receives the text that the user has entered.
                decoration: InputDecoration(
                  labelText: AppStrings.lastName,
                  labelStyle: AppTextStyles.hintText,
                ),

                style: AppTextStyles.inputText,

                validator: (value) {
                  if (value.isEmpty) {
                    return AppStrings.lastNameEmpty;
                  }
                  else{
                    lastName = value;
                  }
                  return null;
                },
              ),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                // The validator receives the text that the user has entered.
                decoration: InputDecoration(
                  labelText: AppStrings.email,
                  labelStyle: AppTextStyles.hintText,
                ),

                style: AppTextStyles.inputText,

                validator: (value) {
                  //TODO write real email validation logic
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

              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                // The validator receives the text that the user has entered.
                decoration: InputDecoration(
                  labelText: AppStrings.confirmPassword,
                  labelStyle: AppTextStyles.hintText,
                ),

                //style: AppTextStyles.inputText,

                validator: (value) {
                  if (value.isEmpty) {
                    return AppStrings.confirmedPasswordEmpty;
                  }
                  else if (!Validator.confirmPassword(password, value)){
                    return AppStrings.confirmPasswordError;
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
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          //TODO write sign up button logic
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
                      },
                      child: Text(
                        AppStrings.signUp,
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