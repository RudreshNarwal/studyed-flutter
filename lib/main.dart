import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyed/config/theme.dart';
import 'package:studyed/pages/onBoarding/on_boarding.dart';
import 'package:studyed/reactive/provider/on_boarding_provider.dart';
import 'package:studyed/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => OnBoardingProvider()),
    ],
    child: MaterialApp(
      title: 'StudyEd ',
      theme: StudyTheme.light,
      onGenerateRoute: Router.generateRoute,
      home: OnBoardingScreen(),
    ));
  }
}
