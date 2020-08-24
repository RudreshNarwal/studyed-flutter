import 'package:flutter/material.dart';
import 'package:studyed/config/theme.dart';

class LiveVideo extends StatefulWidget {
  @override
  _LiveVideoState createState() => _LiveVideoState();
}

class _LiveVideoState extends State<LiveVideo> {


  @override
  Widget build(BuildContext context) {
    return  Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: StudyTheme.gradient1,
              ),
            ),
            child: Text(
              'No live class available right now',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(fontSize: 20),
            ),
          );
        }
}
