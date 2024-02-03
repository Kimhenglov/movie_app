import 'package:flutter/material.dart';
import 'package:pp/MovieAPP/MovieX_app.dart';

void main() {
  runApp(new MoviePracticum_App());
}

//////////

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyCarouselSlider(),
//     );
//   }
// }
//
// class MyCarouselSlider extends StatefulWidget {
//   @override
//   _MyCarouselSliderState createState() => _MyCarouselSliderState();
// }
//
// class _MyCarouselSliderState extends State<MyCarouselSlider> {
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('CarouselSlider with AnimatedSmoothIndicator'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             CarouselSlider.builder(
//               itemCount: 5,
//               options: CarouselOptions(
//                 height: 200,
//                 autoPlay: true,
//                 viewportFraction: 1,
//                 enlargeCenterPage: true,
//                 pageSnapping: true,
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 autoPlayAnimationDuration: const Duration(seconds: 2),
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     _currentIndex = index;
//                   });
//                 },
//               ),
//               itemBuilder: (context, itemIndex, pageViewIndex) {
//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Container(
//                     height: 100,
//                     width: 500,
//                     color: Colors.greenAccent,
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 16),
//             AnimatedSmoothIndicator(
//               activeIndex: _currentIndex,
//               count: 5, // Set the total number of items in the CarouselSlider
//               effect: ExpandingDotsEffect(
//                 activeDotColor: Colors.cyanAccent,
//               ), // You can choose different effects
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
