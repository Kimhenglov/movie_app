import 'package:flutter/material.dart';
import 'package:pp/MovieAPP/page/home_page2.dart';
import 'package:pp/MovieAPP/page/location_page.dart';
import 'package:pp/MovieAPP/page/setting_page.dart';
import 'package:pp/MovieAPP/page/ticket_page.dart';

class MoviePracticum extends StatefulWidget {
  const MoviePracticum({super.key});

  @override
  State<MoviePracticum> createState() => _MoviePracticumState();
}

class _MoviePracticumState extends State<MoviePracticum> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _buildBody(),
      bottomNavigationBar: _buildBotton(),
      drawer: _buildDrawer(),
    );
  }

  // Widget _buildBody2() {
  //   return CupertinoApp(
  //     title: "Testing App",
  //     home: Home_Page2(),
  //   );
  // }

  // Widget _buildBotton2() {
  //   return CupertinoTabScaffold(
  //     tabBar: CupertinoTabBar(
  //       items: [
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.account_circle), label: "Home"),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.airplane_ticket), label: "Ticket"),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.pin_drop), label: "Location"),
  //         BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
  //       ],
  //     ),
  //     tabBuilder: (context, index) {
  //       switch (index) {
  //         case 0:
  //           return CupertinoTabView(
  //             builder: (context) {
  //               return CupertinoPageScaffold(child: Home_Page2());
  //             },
  //           );
  //
  //         case 1:
  //           return CupertinoTabView(
  //             builder: (context) {
  //               return CupertinoPageScaffold(child: Favorite_Page());
  //             },
  //           );
  //
  //         case 2:
  //           return CupertinoTabView(
  //             builder: (context) {
  //               return CupertinoPageScaffold(child: Location_page());
  //             },
  //           );
  //
  //         case 3:
  //           return CupertinoTabView(
  //             builder: (context) {
  //               return CupertinoPageScaffold(child: Setting_page());
  //             },
  //           );
  //       }
  //     },
  //   );
  // }

  int _currentIndex = 0;
  int _prevIndex = -1;

  Widget _buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        Home_Page2(),
        Favorite_Page(),
        Location_page(),
        Setting_page(),

        //TabbarCatagoryScroll(),
        //TestPage(),
        //NSVTest(),
      ],
    );
  }

  Widget _buildBotton() {
    // To Main_page for control
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _prevIndex = _currentIndex;
          _currentIndex = index;

          debugPrint("_prevIndex: $_prevIndex");
          debugPrint(" _currentIndex: $_currentIndex");

          if (_prevIndex == _currentIndex) {
            if (_currentIndex == 0) {
              moviePageKey.currentState!.gotoTop();
            } else if (_currentIndex == 2) {
              moviePageKey.currentState!.gotoTop();
            }
          }
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket), label: "Ticket"),
        BottomNavigationBarItem(icon: Icon(Icons.pin_drop), label: "Location"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
      ],
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      width: 230,
      backgroundColor: Colors.grey[850],
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("logos/MajorCineplex.png"),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.amberAccent,
            ),
            title: Text("Home", style: (TextStyle(color: Colors.white))),
            trailing: Icon(
              Icons.navigate_next,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.call,
              color: Colors.amberAccent,
            ),
            title: Text("Contact", style: (TextStyle(color: Colors.white))),
            trailing: Icon(
              Icons.navigate_next,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.pin_drop,
              color: Colors.amberAccent,
            ),
            title: Text("Location", style: (TextStyle(color: Colors.white))),
            trailing: Icon(
              Icons.navigate_next,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          Divider(
            color: Colors.black12,
            thickness: 5,
          ),
          Center(
            child: Text("@2023",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          Center(
            child: Text("by MajorCineplex KH",
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
