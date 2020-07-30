import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mooddiary/screens/itentify.dart';
import 'package:mooddiary/screens/logs.dart';
import 'package:mooddiary/screens/profile.dart';
import 'package:mooddiary/screens/self_love.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPagechanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(c) {
    pageController.jumpToPage(c);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Identify(),
          Logs(),
          //Profile(),
          SelfLove(),
        ],
        controller: pageController,
        onPageChanged: onPagechanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: (c) {
          onTap(c);
        },
        activeColor: Colors.lightBlueAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            //activeIcon: Icon(calendar_today),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tag_faces),
            //activeIcon: Icon(Icons.add) ,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   // activeIcon: Icon(Icons.add) ,
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            // activeIcon: Icon(Icons.add) ,
          ),
        ],
      ),
    );
  }
}
