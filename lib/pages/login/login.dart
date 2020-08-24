import 'package:flutter/material.dart';
import 'package:studyed/config/images.dart';
import 'package:studyed/config/theme.dart';
import 'package:studyed/router.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: StudyTheme.darkTeal,
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16, top: 50, right: 16),
                    child: Image.asset(
                      Images.loginCover,
                      semanticLabel: 'Login',
                      height: 250,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  _bottomBar(context)
                ],
              ),
            )));
  }

  _validateValues(BuildContext context) {
    if (_formKeyLogin.currentState.validate()) {
      Navigator.pushReplacementNamed(context, Router.dashboard);
    } else {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Something went wrong')));
    }
  }

  _bottomBar(BuildContext context) => Container(
      constraints: BoxConstraints(minHeight: 320),
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: StudyTheme.nearlyWhite,
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(30), topEnd: Radius.circular(30))),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          'Register Account',
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: StudyTheme.darkTeal),
        ),
        SizedBox(
          height: 50,
        ),
        Form(
            key: _formKeyLogin,
            child: Column(children: <Widget>[
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                  _validateValues(context);
                },
                maxLength: 10,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value.length < 10) {
                    return 'Please enter valid mobile number';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                ),
              ),
              // Add TextFormFields and RaisedButton here.
            ])),
        SizedBox(
          height: 40,
        ),
        SizedBox(
            width: double.infinity,
            child: RaisedButton(
                color: StudyTheme.darkTeal,
                child: new Text(
                  "Login",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
                onPressed: () => {_validateValues(context)},
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0))))
      ]));
}
