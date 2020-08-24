import 'package:flutter/material.dart';
import 'package:studyed/config/images.dart';
import 'package:studyed/config/theme.dart';
import 'package:studyed/router.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  FocusNode nodeOne = FocusNode();
  FocusNode nodeTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Images.registerCover,
                  semanticLabel: 'Register',
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
    if (_formKey.currentState.validate()) {
      Navigator.pushReplacementNamed(context, Router.loginRoute);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Something went wrong')));
    }
  }

  _bottomBar(BuildContext context) => Container(
      constraints: BoxConstraints(minHeight: 380),
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: StudyTheme.nearlyWhite,
          borderRadius:
              BorderRadiusDirectional.only(topStart: Radius.circular(30), topEnd: Radius.circular(30))),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          'Register Account',
          style: Theme.of(context).textTheme.headline5.copyWith(color: StudyTheme.darkTeal),
        ),
        Form(
            key: _formKey,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
              TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(nodeOne);
                },
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value.length < 3) {
                    return 'Please enter valid first name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                focusNode: nodeOne,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(nodeTwo);
                },
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value.length < 3) {
                    return 'Please enter valid last name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                focusNode: nodeTwo,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                  _validateValues(context);
                },
                keyboardType: TextInputType.number,
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
            width: double.infinity,
            child: RaisedButton(
                color: StudyTheme.darkTeal,
                child: new Text(
                  "Register",
                  style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                ),
                onPressed: () => {_validateValues(context)},
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))))
      ]));
}
