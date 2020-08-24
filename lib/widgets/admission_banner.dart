import 'package:flutter/material.dart';
import 'package:studyed/config/images.dart';
import 'package:studyed/config/theme.dart';

class AdmissionBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 100,
            alignment: Alignment.centerRight,
            width: double.infinity,
            child: Image.asset(
              Images.classroom,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Opacity(
            opacity: 0.8,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: StudyTheme.linearGradient,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: StudyTheme.gradient1,
                    blurRadius: 30.0,
                    spreadRadius: -15.0,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Admission now open for 2020,',
                    // 'Admission for 2020 session, start soon.',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(6.0)),
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Enroll Now'.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.white, letterSpacing: 1.5, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
