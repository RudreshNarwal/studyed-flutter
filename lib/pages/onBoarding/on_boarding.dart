import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyed/config/images.dart';
import 'package:studyed/reactive/provider/on_boarding_provider.dart';
import '../../config/theme.dart';
import '../../router.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex;
  OnBoardingProvider _onBoardingProvider;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _onBoardingProvider = Provider.of<OnBoardingProvider>(context, listen: true);
    _currentIndex = _onBoardingProvider.currentIndex;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Row(
                  children: List.generate(
                      3,
                      (index) => Padding(
                          padding: EdgeInsets.all(2),
                          child: index == _currentIndex
                              ? CircleAvatar(
                                  backgroundColor: StudyTheme.primary,
                                  radius: 7,
                                )
                              : CircleAvatar(
                                  backgroundColor: StudyTheme.teal[100],
                                  radius: 5,
                                )))),
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                GestureDetector(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'SKIP',
                        style: Theme.of(context).textTheme.button.copyWith(color: StudyTheme.darkTeal),
                      )),
                  onTap: () => {
                    _pageController.animateToPage(2,
                        duration: Duration(milliseconds: 300), curve: Curves.easeIn)
                  },
                )
              ],
            ),
            backgroundColor: StudyTheme.darkTeal,
            body: PageView.builder(
              controller: _pageController,
              onPageChanged: (current)=>{
                print('$current'),
              _onBoardingProvider.currentIndex = current
            },
              itemBuilder: (context, position) {
                return Stack(
                  children: [_whiteContainer(context, position: position), _yellowContainer(context)],
                );
              },
              itemCount: 3, // Can be null
            ),
            floatingActionButton: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: FloatingActionButton(
                  onPressed: () {
                    _currentIndex == 2
                        ? Navigator.pushReplacementNamed(context, Router.registerRoute)
                        : _pageController.nextPage(
                            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                  },
                  child: Icon(_currentIndex == 2 ? Icons.done : Icons.arrow_forward_ios),
                ))));
  }

  _whiteContainer(BuildContext context, {int position}) => Container(
      margin: EdgeInsets.only(bottom: 90),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(70))),
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Text(
            'Explore',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3.copyWith(color: StudyTheme.darkTeal),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text('Get access to wide range of resources talored just for you',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: StudyTheme.darkTeal))),
          Image.asset(
            Images.onBoardingCover1,
            height: 250,
            fit: BoxFit.fitHeight,
          ),
        ],
      )));

  Widget _yellowContainer(context) => Positioned(
      left: 100,
      bottom: 50,
      child: Container(
        padding: EdgeInsets.all(16),
        height: 110,
        width: 300,
        constraints: BoxConstraints(maxHeight: 130, maxWidth: 310),
        decoration: BoxDecoration(color: StudyTheme.yellowColor, borderRadius: StudyTheme.smallCard),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Get Started',
              style: Theme.of(context).textTheme.bodyText2.copyWith(color: StudyTheme.darkTeal),
            ),
            Text(
              'Welcome to \nStudyEd',
              style: Theme.of(context).textTheme.headline5.copyWith(color: StudyTheme.darkTeal),
            )
          ],
        ),
      ));
}
