// import 'package:flutter/material.dart';
// import 'package:pp/MovieAPP/constants/movie_list_constants.dart';
// import 'package:pp/MovieAPP/models/movie_model.dart';
//
// class NSVTest extends StatelessWidget {
//   //const NSVTest({super.key});
//   late TabController myController;
//
//   List<String> posts = [
//     "Logo/fe.png"
//         "Logo/Cinema_rv.png"
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DefaultTabController(
//         length: 3,
//         child: NestedScrollView(
//           physics: NeverScrollableScrollPhysics(),
//           headerSliverBuilder: (context, isScolled) {
//             return [
//               SliverAppBar(
//                 backgroundColor: Colors.white,
//                 collapsedHeight: 400, // 390
//                 expandedHeight: 400,
//                 //flexibleSpace: Home_Page2(),
//               ),
//               SliverPersistentHeader(
//                 delegate: MyDelegate(TabBar(
//                   tabs: [
//                     Tab(icon: Icon(Icons.grid_on)),
//                     Tab(icon: Icon(Icons.favorite_border_outlined)),
//                     Tab(icon: Icon(Icons.bookmark_border)),
//                   ],
//                   indicatorColor: Colors.blue,
//                   unselectedLabelColor: Colors.grey,
//                   labelColor: Colors.black,
//                 )),
//                 floating: true,
//                 pinned: true,
//               )
//             ];
//           },
//           body: TabBarView(
//             //controller: myController,
//             children: [
//               GridView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: movieList.length,
//                 padding: EdgeInsets.all(2),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 6 / 10,
//                   crossAxisSpacing: 1,
//                   mainAxisSpacing: 1,
//                 ),
//                 itemBuilder: (context, index) {
//                   return _buildGridItem(movieList[index]);
//                 },
//               ),
//             ],
//             // children: [1, 2, 3]
//             //     .map((tab) => GridView.count(
//             //           physics: BouncingScrollPhysics(),
//             //           crossAxisCount: 3,
//             //           shrinkWrap: true,
//             //           mainAxisSpacing: 2.0,
//             //           crossAxisSpacing: 2.0,
//             //           children: movieList
//             //               .map((e) => Container(
//             //                     decoration: BoxDecoration(
//             //                         image: DecorationImage(
//             //                             image: AssetImage(e),
//             //                             fit: BoxFit.fill)),
//             //                   ))
//             //               .toList(),
//             //         ))
//             //     .toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Widget _buildGridItem(MovieModels item) {
//   return InkWell(
//     onTap: () {
//       // Navigator.of(context).push(
//       //   MaterialPageRoute(
//       //     builder: (context) => MovieDetailPage(item),
//       //     fullscreenDialog: true,
//       //   ),
//       // );
//     },
//     //child: Image.network(item.img,fit: BoxFit.cover),
//     child: Container(
//       color: Colors.grey[900],
//       padding: EdgeInsets.all(1),
//       margin: EdgeInsets.all(1),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 240,
//             width: double.maxFinite,
//             child: Image.network(item.image, fit: BoxFit.cover),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(6.0),
//             child: Text(
//               "23 FEBRUARY 2023",
//               style: TextStyle(
//                 color: Colors.amberAccent[100],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "${item.title}",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// class MyDelegate extends SliverPersistentHeaderDelegate {
//   MyDelegate(this.tabBar);
//   final TabBar tabBar;
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Colors.white,
//       child: tabBar,
//     );
//   }
//
//   @override
//   double get maxExtent => tabBar.preferredSize.height;
//
//   @override
//   double get minExtent => tabBar.preferredSize.height;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
