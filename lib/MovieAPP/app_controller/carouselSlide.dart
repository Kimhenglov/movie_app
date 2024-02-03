import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pp/MovieAPP/models/api_movie_models.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../service/constants.dart';

class CarouselSlide_Page extends StatefulWidget {
  const CarouselSlide_Page({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  _CarouselSlidePageState createState() => _CarouselSlidePageState();
}

class _CarouselSlidePageState extends State<CarouselSlide_Page> {
  late Future<List<Movie>> trendingMovie;
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: trendingMovie,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data as List<Movie>;
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: data.length,
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
                        child: Image.network(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                          "${Constants.imagePATH}${snapshot.data[itemIndex].posterPath}",
                        ),
                        // You can replace the color with your movie data
                        // data[itemIndex].imagePath or something similar
                      ),
                    );
                  },
                ),
                SizedBox(height: 15),
                AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: data.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.cyanAccent,
                    dotWidth: 12,
                    dotHeight: 12,
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
