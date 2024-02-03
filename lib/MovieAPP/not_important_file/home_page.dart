// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:pp/MovieAPP/constants/movie_list_constants.dart';
//
// final moviePageKey = GlobalKey<_HomePageState>();
//
// class HomePage extends StatefulWidget {
//   //const HomePage({super.key});
//
//   final Key key = moviePageKey;
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
// class _HomePageState extends State<HomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController myController;
//
//   void initState() {
//     myController = new TabController(length: 2, vsync: this);
//     super.initState();
//   }
//   //TabController tabController = TabController(length: 3, vsync:);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: _buildAppBar(),
//       body: _buildBodyPage(),
//     );
//   }
//
//   ScrollController _scroller = ScrollController();
//
//   gotoTop() {
//     _scroller.animateTo(0,
//         duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       //title: Text("Welcome"),
//       backgroundColor: Colors.white,
//       shadowColor: Colors.white,
//       actions: [
//         IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.notifications,
//               color: Colors.black,
//             ))
//       ],
//       leading: IconButton(
//         icon: Icon(
//           Icons.dehaze_rounded,
//           color: Colors.black,
//         ),
//         onPressed: () {
//           _scaffoldKey.currentState!.openDrawer();
//         },
//       ),
//     );
//   }
//
//   Widget _buildBodyPage() {
//     return ListView(
//       physics: BouncingScrollPhysics(),
//       controller: _scroller,
//       //shrinkWrap: true,
//       children: [
//         _buildTextHeader1(),
//         _buildTextHeader2(),
//         _buildCarousel(),
//         _buildCategoryText(),
//         _buildSelectTabbar(),
//       ],
//     );
//
//     // Add Custom ScrollView
//   }
//
//   Widget _buildTextHeader1() {
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 17, top: 10),
//         child: Row(
//           children: [
//             Text(
//               "Discover your",
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextHeader2() {
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 15),
//         child: Row(
//           children: [
//             Text(
//               "favorite Movie",
//               style: TextStyle(
//                 fontSize: 35,
//                 color: Colors.greenAccent,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   int _currentIndex = 0;
//
//   final CarouselController _controller = CarouselController();
//
//   Widget _buildCarousel() {
//     return Container(
//       child: Column(
//         children: [
//           CarouselSlider(
//             options: CarouselOptions(
//               autoPlay: true,
//               // enlargeCenterPage: true,
//               //scrollDirection: Axis.vertical,
//               onPageChanged: (index, reason) {
//                 setState(
//                   () {
//                     _currentIndex = index;
//                   },
//                 );
//               },
//             ),
//             items: movieList
//                 .map(
//                   (item) => Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       margin: EdgeInsets.only(
//                         top: 10.0,
//                         bottom: 10.0,
//                       ),
//                       elevation: 6.0,
//                       shadowColor: Colors.redAccent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(30.0),
//                         ),
//                         child: Stack(
//                           children: <Widget>[
//                             Image.network(
//                               item.image,
//                               fit: BoxFit.fitWidth,
//                               width: double.infinity,
//                             ),
//                             // Center(
//                             //   child: Text(
//                             //     '${item.title[_currentIndex]}',
//                             //     style: TextStyle(
//                             //       fontSize: 24.0,
//                             //       fontWeight: FontWeight.bold,
//                             //       backgroundColor: Colors.black45,
//                             //       color: Colors.red,
//                             //     ),
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: movieList.map((urlOfItem) {
//               int index = movieList.indexOf(urlOfItem);
//
//               return GestureDetector(
//                 onTap: () => _controller.animateToPage(index),
//                 child: Container(
//                   width: _currentIndex == index ? 17 : 7,
//                   height: 7.0,
//                   margin: EdgeInsets.symmetric(horizontal: 3.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     // shape: BoxShape.circle,
//                     color: _currentIndex == index
//                         ? Colors.greenAccent
//                         : Color.fromRGBO(0, 0, 0, 0.3),
//                   ),
//                 ),
//               );
//             }).toList(),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategoryText() {
//     return NestedScrollView(
//       headerSliverBuilder: (context, value) {
//         return [
//           Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 Text(
//                   "Category",
//                   style: TextStyle(fontSize: 20, color: Colors.pink),
//                 ),
//               ],
//             ),
//           ),
//         ];
//       },
//       body: Container(),
//     );
//   }
//
//   Widget _buildSelectTabbar() {
//     return Container(
//       alignment: Alignment.center,
//       //padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         color: Colors.pink,
//       ),
//       child: TabBar(
//         indicator: BoxDecoration(
//           borderRadius: BorderRadius.circular(50),
//           color: Colors.orange,
//         ),
//         controller: myController,
//         isScrollable: true,
//         labelPadding: EdgeInsets.symmetric(horizontal: 50),
//         tabs: [
//           Tab(
//               child: Container(
//             color: Colors.lightBlue,
//           )),
//           Tab(
//             child: Text(
//               "168",
//               style: TextStyle(fontSize: 20, color: Colors.amberAccent),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTabbarView() {
//     return TabBarView(
//       controller:
//           myController, // Assuming you have a TabController named myController
//       children: [
//         Center(
//           child: Text(
//             'Content for Tab 1',
//             style: TextStyle(fontSize: 24),
//           ),
//         ),
//         Center(
//           child: Text(
//             'Content for Tab 2',
//             style: TextStyle(fontSize: 24),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSelectTabbar1() {
//     return Container(
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         color: Colors.pink,
//       ),
//       child: TabBar(
//         indicator: BoxDecoration(
//           borderRadius: BorderRadius.circular(50),
//           color: Colors.orange,
//         ),
//         controller: myController,
//         isScrollable: true,
//         labelPadding: EdgeInsets.symmetric(horizontal: 50),
//         tabs: [
//           Tab(
//             child: Text(
//               "168",
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           Tab(
//             child: Text(
//               "168",
//               style: TextStyle(fontSize: 20, color: Colors.amberAccent),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTabbarView1() {
//     return TabBarView(
//       controller: myController,
//       children: [
//         Center(
//           child: Text(
//             'Content for Tab 1',
//             style: TextStyle(fontSize: 24),
//           ),
//         ),
//         Center(
//           child: Text(
//             'Content for Tab 2',
//             style: TextStyle(fontSize: 24),
//           ),
//         ),
//       ],
//     );
//   }
// }
