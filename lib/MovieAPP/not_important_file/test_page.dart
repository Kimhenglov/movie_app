// import 'package:flutter/material.dart';
// import 'package:pp/MovieAPP/page/tabbarCT_scroll.dart';
//
// class TestPage extends StatefulWidget {
//   const TestPage({super.key});
//
//   @override
//   State<TestPage> createState() => _TestPageState();
// }
//
// class _TestPageState extends State<TestPage>
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
//       appBar: AppBar(
//         title: Text("Hello"),
//       ),
//       body: TabbarCatagoryScroll(),
//     );
//   }
//
//   Widget _TestSliver() {
//     return DefaultTabController(
//       length: 2,
//       child: NestedScrollView(
//         headerSliverBuilder: (context, value) {
//           return [
//             SliverAppBar(
//               title: Text("Hello23"),
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
//             ListView.builder(
//                 physics: BouncingScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: 15,
//                 itemBuilder: (context, _currentIndex) {
//                   return Card(
//                     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     child: ListTile(
//                       leading: Icon(
//                         Icons.dialer_sip,
//                         color: Colors.red,
//                       ),
//                       title: Text("Hello"),
//                       subtitle: Text("World"),
//                       trailing: Icon(Icons.ac_unit),
//                     ),
//                   );
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildText() {
//     return Text(
//       "Catagory",
//       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//     );
//   }
//
//   Widget _buildCta() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20),
//       child: Column(
//         children: [
//           Card(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//             elevation: 0, // Shadow
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               child: TabBar(
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
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: myController,
//               children: [
//                 ListView.builder(
//                     physics: BouncingScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: 15,
//                     itemBuilder: (context, _currentIndex) {
//                       return Card(
//                         margin:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                         child: ListTile(
//                           leading: Icon(
//                             Icons.dialer_sip,
//                             color: Colors.red,
//                           ),
//                           title: Text("Hello"),
//                           subtitle: Text("World"),
//                           trailing: Icon(Icons.ac_unit),
//                         ),
//                       );
//                     }),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
