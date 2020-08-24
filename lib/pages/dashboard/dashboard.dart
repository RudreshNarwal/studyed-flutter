import 'package:flutter/material.dart';
import 'package:studyed/router.dart';
import '../../config/images.dart';
import '../../config/theme.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentVal;
  List _tabs = ['Newest', 'Popular', 'Featured'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length, // This is the number of tabs.
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[_sliverAppbar(context, innerBoxIsScrolled: innerBoxIsScrolled)];
          },
          body: Material(
              child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 16, right: 16),
            child: TabBarView(children: [_list(context), _list(context), _list(context)]),
          )),
        ));
  }

  _sliverAppbar(BuildContext context, {bool innerBoxIsScrolled}) => SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: StudyTheme.darkTeal,
              size: 30,
            ),
            tooltip: 'Menu',
            onPressed: () => {},
          ),
          centerTitle: false,
          title: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            color: Colors.transparent,
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                isDense: true, // Added this
                hintText: "Search Location",
                contentPadding: EdgeInsets.all(10),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: StudyTheme.nearlyWhite,
          flexibleSpace: FlexibleSpaceBar(
            background: _userInfo(context),
          ),
          actions: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: ExactAssetImage(Images.circleAvatar),
              backgroundColor: Colors.transparent,
            )
          ],
          // This is the title in the app bar.
          pinned: true,
          expandedHeight: 220.0,
          forceElevated: innerBoxIsScrolled,
          bottom: TabBar(
            labelColor: StudyTheme.darkTeal,
            unselectedLabelColor: StudyTheme.darkGrey.withOpacity(.6),
            tabs: List.generate(
                _tabs.length,
                (index) => Tab(
                      text: _tabs[index],
                    )),
          ),
        ),
      );

  _userInfo(BuildContext context) => Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey Shibu!',
              style: Theme.of(context).textTheme.headline4.copyWith(color: StudyTheme.teal[600]),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Select an Institute from where you want to study.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      );

  _list(BuildContext context) => ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            leading: Image.asset(
              Images.instituteIcon,
              height: 180,
              fit: BoxFit.fitHeight,
            ),
            title: Text(
              'STC Coaching',
              style: Theme.of(context).textTheme.headline6.copyWith(color: StudyTheme.darkTeal),
            ),
            subtitle: Text(
              'Search for the courses you want to study',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.bookmark_border,
                size: 25,
              ),
              onPressed: () => {},
            ),
            onTap: () => {
              Navigator.pushNamed(context, Router.institute)
            },
          );
        },
      );
}
