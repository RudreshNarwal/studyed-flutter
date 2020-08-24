import 'package:flutter/material.dart';
import 'package:studyed/widgets/admission_banner.dart';
import 'package:studyed/widgets/live_video.dart';
import 'package:studyed/widgets/subjects.dart';

class InstituteHome extends StatefulWidget {
  @override
  _InstituteHomeState createState() => _InstituteHomeState();
}

class _InstituteHomeState extends State<InstituteHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          AdmissionBanner(),
          SizedBox(height: 40),
          LiveVideo(),
          SizedBox(height: 40),
          Subjects(),
          SizedBox(height: 30),
        ],
      ),
    )));
  }
}
