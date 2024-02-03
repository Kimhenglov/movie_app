import 'dart:ui';

import 'package:flutter/material.dart';

class Location_page extends StatefulWidget {
  @override
  _Location_pageState createState() => _Location_pageState();
}

class _Location_pageState extends State<Location_page>
    with SingleTickerProviderStateMixin {
  List<String> _cartItems = [];
  Map<String, bool> _favoriteItems = {};

  void _toggleFavorite(String item) {
    setState(() {
      _favoriteItems[item] = !_favoriteItems[item]!;
    });
  }

  void _addItemToCart(String item) {
    setState(() {
      _cartItems.add(item);
      _favoriteItems[item] = true;
    });
    _showSnackBar(item, 'added to favorites');
  }

  void _removeItemFromCart(String item) {
    setState(() {
      _cartItems.remove(item);
      _favoriteItems[item] = false;
    });
    _showSnackBar(item, 'removed from favorites');
  }

  void _showSnackBar(String item, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$item $action'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            if (action.contains('added')) {
              _removeItemFromCart(item);
            } else {
              _addItemToCart(item);
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Location",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      elevation: 0,
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.white,
      child: _buildSeleted_Button(),
    );
  }

  Widget _buildSeleted_Button() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(
                    child: Text("Location",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white)),
                  ),
                  Tab(
                    child: Text("Favorite",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(12),
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           Text(
          //             "Select your nearby",
          //             style: TextStyle(
          //               fontSize: 30,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //       Row(
          //         children: [
          //           Text(
          //             "Cinema",
          //             style: TextStyle(
          //               fontSize: 35,
          //               color: Colors.greenAccent,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: TabBarView(
              children: [
                _buildLocationPage(),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: _buildCartPage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationPage() {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Select your nearby",
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
                    "Cinema",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        _buildItemCard('PhnomPenh'),
        _buildItemCard('SieamReap'),
        _buildItemCard('SihanoukVille'),
      ],
    );
  }

  // ... Existing code

  Widget _buildItemCard(String itemName) {
    bool isFavorite = _favoriteItems[itemName] ?? false;

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            Image.asset(
              getImagePath(itemName), // Update image path dynamically
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    itemName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      if (isFavorite) {
                        _removeItemFromCart(itemName);
                      } else {
                        _addItemToCart(itemName);
                      }
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white54,
                      child: IconButton(
                        onPressed: () {
                          if (isFavorite) {
                            _removeItemFromCart(itemName);
                          } else {
                            _addItemToCart(itemName);
                          }
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
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

// ... Existing code

  String getImagePath(String itemName) {
    // Map each item to its respective image path
    switch (itemName) {
      case 'PhnomPenh':
        return 'Logo/phnompenh.jpeg';
      case 'SieamReap':
        return 'Logo/siemreap.jpg';
      case 'Sihanoukville':
        return 'Logo/kps.jpeg';
      default:
        return 'Logo/kps.jpeg'; // Provide a default image path or handle differently
    }
  }

// ... Existing code

  Widget _buildCartPage() {
    return ListView.builder(
      itemCount: _cartItems.length,
      itemBuilder: (context, index) {
        return _buildCartItemCard(_cartItems[index]);
      },
    );
  }

  Widget _buildCartItemCard(String itemName) {
    bool isFavorite = _favoriteItems[itemName] ?? false;

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            Image.asset(
              getImagePath(itemName),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.0,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    itemName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      _removeItemFromCart(itemName);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white54,
                      child: IconButton(
                        onPressed: () {
                          _removeItemFromCart(itemName);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
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
