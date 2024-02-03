// import 'package:flutter/material.dart';
//
// import '../constants/movie_list_constants.dart';
// import '../models/movie_model.dart';
//
// class TabbarCatagoryScroll extends StatefulWidget {
//   const TabbarCatagoryScroll({super.key});
//
//   @override
//   State<TabbarCatagoryScroll> createState() => _TabbarCatagoryScrollState();
// }
//
// class _TabbarCatagoryScrollState extends State<TabbarCatagoryScroll>
//     with SingleTickerProviderStateMixin {
//   late TabController myController;
//
//   void initState() {
//     myController = new TabController(length: 2, vsync: this);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _TestTabbbar(),
//       //body: _buildContainer(),
//     );
//   }
//
//   Widget _buildContainer() {
//     return Padding(
//       padding: EdgeInsets.all(8),
//       child: Text("Hello", style: TextStyle(fontSize: 20)),
//     );
//   }
//
//   Widget _TestTabbbar() {
//     return DefaultTabController(
//       length: 2,
//       child: NestedScrollView(
//         headerSliverBuilder: (context, value) {
//           return [
//             SliverAppBar(
//               title: Text("Hello22"),
//               pinned: true,
//               floating: true,
//               snap: true,
//               bottom: TabBar(
//                 indicator: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: Colors.greenAccent,
//                 ),
//                 controller: myController,
//                 isScrollable: true,
//                 labelPadding: EdgeInsets.symmetric(horizontal: 12),
//                 tabs: [
//                   Tab(
//                     child: Text("Now Showing",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                           color: Colors.white,
//                         )),
//                   ),
//                   Tab(
//                     child: Text("Comming Soon",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18)),
//                   ),
//                 ],
//               ),
//             ),
//           ];
//         },
//         body: TabBarView(
//           controller: myController,
//           children: [
//             GridView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: movieList.length,
//               padding: EdgeInsets.all(2),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 6 / 10,
//                 crossAxisSpacing: 1,
//                 mainAxisSpacing: 1,
//               ),
//               itemBuilder: (context, index) {
//                 return _buildGridItem(movieList[index]);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildGridItem(MovieModels item) {
//     return InkWell(
//       onTap: () {
//         // Navigator.of(context).push(
//         //   MaterialPageRoute(
//         //     builder: (context) => MovieDetailPage(item),
//         //     fullscreenDialog: true,
//         //   ),
//         // );
//       },
//       //child: Image.network(item.img,fit: BoxFit.cover),
//       child: Container(
//         color: Colors.grey[900],
//         padding: EdgeInsets.all(1),
//         margin: EdgeInsets.all(1),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 240,
//               width: double.maxFinite,
//               child: Image.network(item.image, fit: BoxFit.cover),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(6.0),
//               child: Text(
//                 "23 FEBRUARY 2023",
//                 style: TextStyle(
//                   color: Colors.amberAccent[100],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "${item.title}",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
