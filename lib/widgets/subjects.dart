import 'package:flutter/material.dart';
import 'package:studyed/config/images.dart';
import 'package:studyed/config/theme.dart';

class Subjects extends StatefulWidget {
  const Subjects({
    Key key,
  }) : super(key: key);

  @override
  _SubjectsState createState() => _SubjectsState();
}

const gradients = [
  {'gradient': StudyTheme.purpPinklinearGradient, 'shadow': Color(0xFFE100FF)},
  {'gradient': StudyTheme.scotterlinearGradient, 'shadow': Color(0xFF5B86E5)},
  {'gradient': StudyTheme.alivelinearGradient, 'shadow': Color(0xFFBD3F32)},
  {'gradient': StudyTheme.meridianlinearGradient, 'shadow': Color(0xFF45a247)},
  {'gradient': StudyTheme.chityllinearGradient, 'shadow': Color(0xFF78ffd6)},
];

class _SubjectsState extends State<Subjects> {
  List listSubject = ['Maths', 'Physics', 'Chemistry', 'Biology', 'Physical'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: 400)),
      builder: (context, snapshot) {
        if (listSubject != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hi, what would you learn today?',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 2 / 1,
                children: <Widget>[
                  for (int i = 0; i < listSubject.length; i++)
                    _subjectCard(
                      context,
                      subject: listSubject[i],
                      gradient: gradients[i]['gradient'],
                      shadow: gradients[i]['shadow'],
                    ),
                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  _subjectCard(BuildContext context, {subject, gradient, shadow}) => Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: shadow,
              blurRadius: 15.0,
              spreadRadius: -15.0,
              offset: Offset(
                5.0,
                5.0,
              ),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: Image.asset(
                  Images.instituteIcon,
                  fit: BoxFit.cover,
                  width: 36,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  subject.name,
                  style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
}
