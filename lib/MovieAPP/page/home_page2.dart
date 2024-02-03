import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pp/MovieAPP/app_controller/carouselSlide.dart';
import 'package:pp/MovieAPP/models/api_movie_models.dart';
import 'package:pp/MovieAPP/page_detail/home_page_detail.dart';
import 'package:pp/MovieAPP/service/api.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/movie_list_constants.dart';
import '../models/movie_model.dart';

final moviePageKey = GlobalKey<_Home_Page2State>();

class Home_Page2 extends StatefulWidget {
  final Key key = moviePageKey;

  @override
  State<Home_Page2> createState() => _Home_Page2State();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _Home_Page2State extends State<Home_Page2>
    with SingleTickerProviderStateMixin {
  ///////////API///////////////

  late Future<List<Movie>> trendingMovie;

  // void initState() {
  //   super.initState();
  //   trendingMovie = API().getTrendingMovie();
  // }

  ///////////END-API///////////////

  late TabController myController;

  void initState() {
    myController = new TabController(length: 2, vsync: this);

    trendingMovie = API().getTrendingMovie();
    super.initState();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildDefaultTabBar(),
      drawer: _buildDrawer(),
    );
  }

  ScrollController _scroller = ScrollController();

  gotoTop() {
    _scroller.animateTo(0,
        duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  AppBar _buildAppBar() {
    return AppBar(
      bottomOpacity: 0.0,
      elevation: 0.0,
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();

            ///
          },
          icon: Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        ),
      ],
      leading: IconButton(
        icon: Icon(
          Icons.dehaze_rounded,
          color: Colors.black,
        ),
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      width: 230,
      backgroundColor: Colors.greenAccent,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("Logo/phnompenh.jpeg"),
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
            child: Text("@2024",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          Center(
            child:
                Text("by M-Cinema KH", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.only(left: 17, right: 17, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Discover your",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "favorite Movie",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Center(
              child: FutureBuilder(
                future: trendingMovie,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return CarouselSlide_Page(snapshot: snapshot);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
          ///////////////////////////////////////////////////////////////////////////
          Row(
            children: [
              Text(
                "Category",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          /////// Here
        ],
      ),
    );
  }

  Widget _buildDefaultTabBar() {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, isScolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              collapsedHeight: 350, // 390
              expandedHeight: 350,
              flexibleSpace: _buildBody(),
            ),
            SliverPersistentHeader(
              delegate: MyDelegate(
                TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(53),
                    color: Colors.greenAccent,
                  ),
                  //labelColor: Colors.orange,
                  controller: myController,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 12),
                  tabs: [
                    Tab(
                      child: Text("Now Showing",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white)),
                    ),
                    Tab(
                      child: Text("Comming Soon",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white)),
                    ),
                  ],
                ),
              ),
              floating: true,
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: myController,
          children: [
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: movieList.length,
              padding: EdgeInsets.all(3),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 6 / 10,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                return _buildGridItem(movieList[index]);
              },
            ),
            Container(
              color: Colors.yellow,
              child: Center(
                child: Text("Page2"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(MovieModels item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomePage_Detail(),
            fullscreenDialog: true,
          ),
        );
      },
      //child: Image.network(item.img,fit: BoxFit.cover),
      child: Container(
        color: Colors.grey[900],
        padding: EdgeInsets.all(1),
        margin: EdgeInsets.all(1),
        child: Column(
          children: [
            SizedBox(
              height: 240,
              width: double.maxFinite,
              child: Image.network(item.image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "23 FEBRUARY 2023",
                style: TextStyle(
                  color: Colors.amberAccent[100],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${item.title}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///////////////////////////////////

  int _currentIndex = 0;
  //
  // final CarouselController _controller = CarouselController();
  //
  Widget _buildCarousel() {
    return Center(
      child: Column(
        children: [
          FutureBuilder(
              future: trendingMovie,
              builder: (context, reason) {
                if (reason.hasError) {
                  return Center(
                    child: Text(reason.error.toString()),
                  );
                } else if (reason.hasData) {
                  final data = reason.data;
                  return _buildCarousel();
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          CarouselSlider.builder(
            itemCount: 5,
            options: CarouselOptions(
              height: 180,
              autoPlay: true,
              viewportFraction: 1,
              enlargeCenterPage: true,
              pageSnapping: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 50,
                  width: 400,
                  color: Colors.greenAccent,
                ),
              );
            },
          ),
          SizedBox(height: 15),
          AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: 5,
            // Set the total number of items in the CarouselSlider
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.cyanAccent,
              dotWidth: 12,
              dotHeight: 12,
            ),
            // You can choose different effects
          ),
        ],
      ),
    );
    // return Container(
    //   margin: EdgeInsets.only(
    //     right: 25,
    //     left: 0,
    //   ),
    //   child: Column(
    //     children: [
    //       CarouselSlider(
    //         options: CarouselOptions(
    //           autoPlay: true,
    //           enlargeCenterPage: true,
    //
    //           //scrollDirection: Axis.vertical,
    //           onPageChanged: (index, reason) {
    //             setState(
    //               () {
    //                 _currentIndex = index;
    //               },
    //             );
    //           },
    //         ),
    //         items: movieList
    //             .map(
    //               (item) => Padding(
    //                 padding: const EdgeInsets.all(5.0),
    //                 child: Card(
    //                   margin: EdgeInsets.only(
    //                     top: 7.0,
    //                     bottom: 7.0,
    //                   ),
    //                   elevation: 8.0,
    //                   //shadowColor: Colors.redAccent,
    //                   shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(25.0),
    //                   ),
    //                   child: ClipRRect(
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(25.0),
    //                     ),
    //                     child: Stack(
    //                       children: <Widget>[
    //                         Image.network(
    //                           //item.image,
    //                           "${Constants.imagePATH}",
    //                           fit: BoxFit.fitWidth,
    //                           width: double.infinity,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             )
    //             .toList(),
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: movieList.map((urlOfItem) {
    //           int index = movieList.indexOf(urlOfItem);
    //
    //           return GestureDetector(
    //             onTap: () => _controller.animateToPage(index),
    //             child: Container(
    //               width: _currentIndex == index ? 17 : 7,
    //               height: 7.0,
    //               margin: EdgeInsets.symmetric(horizontal: 3.0),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(10),
    //                 // shape: BoxShape.circle,
    //                 color: _currentIndex == index
    //                     ? Colors.greenAccent
    //                     : Color.fromRGBO(0, 0, 0, 0.3),
    //               ),
    //             ),
    //           );
    //         }).toList(),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    //   elevation: 2, // Shadow
    //   child: Container(
    //     alignment: Alignment.center,
    //     decoration: BoxDecoration(
    //       //color: Colors.black.withOpacity(0.2),
    //       color: Colors.lightBlue,
    //       borderRadius: BorderRadius.circular(50),
    //     ),
    //     child: tabBar,
    //     /////
    //   ),
    // );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 42),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        //color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(52),
      ),
      child: tabBar,
      /////
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
