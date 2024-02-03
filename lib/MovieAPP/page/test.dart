import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/location_list_constants.dart';
import '../logic/favorite_item_logic.dart';
import '../models/location_models.dart';

class TestItem extends StatefulWidget {
  const TestItem({super.key});

  @override
  State<TestItem> createState() => _TestItemState();
}

class _TestItemState extends State<TestItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCardItem1(),
    );
  }

  Widget _buildCardItem1() {
    return ListView.builder(
        itemCount: locationList.length,
        itemBuilder: (context, index) {
          return _buildCard1(locationList[index]);
          //return _buildCard2(locationList[index]);
        });
  }

  Widget _buildCard1(LocationModels item) {
    bool isFavorite = context.watch<FavoriteItem_Logic>().isFavorite(item);
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            // Your image goes here
            Image.network(
              item.image, // Use the image URL from LocationModels
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
            ),
            // BackdropFilter for the blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            // Content inside the card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    item.title, // Use the title from LocationModels
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 125),
                    child: CircleAvatar(
                      backgroundColor: Colors.white54,
                      child: IconButton(
                        onPressed: () {
                          ////////////////////
                          //////////////
                          if (isFavorite) {
                            context
                                .read<FavoriteItem_Logic>()
                                .removeFromList(item);
                          } else {
                            context.read<FavoriteItem_Logic>().addToList(item);
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
