import 'package:flutter/material.dart';
import 'package:pp/MovieAPP/models/movie_model.dart';

class Favorite_Page extends StatefulWidget {
  const Favorite_Page({super.key});

  @override
  State<Favorite_Page> createState() => _Favorite_PageState();
}

enum ButtonState { init, loading, done }

class _Favorite_PageState extends State<Favorite_Page> {
  ButtonState state = ButtonState.init;

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDone = state == ButtonState.done;
    final isStretched = state == ButtonState.init;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildApppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildApppBar() {
    return AppBar(
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: Text(
        "Ticket",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.card_travel,
              color: Colors.black,
            ))
      ],
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        _buildBody2(),
      ],
    );
  }

  Widget _buildBody2() {
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 50,
          shadowColor: Colors.yellow,
          color: Colors.black,
          child: SizedBox(
            width: 350,
            height: 660, //850
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.network(
                    "https://th.bing.com/th/id/OIP.UdDwuK_Vw-howhWfBNXaQQHaK-?pid=ImgDet&rs=1",
                    height: 350,
                    width: 350,
                  ),
                  Text(
                    "What's Movie",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Divider(
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                    thickness: 5,
                    color: Colors.greenAccent,
                  ),
                  Container(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 230),
                    child: Text(
                      "INFO",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 5,
                    indent: 15,
                    endIndent: 240,
                    thickness: 2,
                    color: Colors.greenAccent,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "THEATRE 3",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Container(
                          width: 150,
                        ),
                        Text(
                          "KH/--",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Icon(
                          Icons.volume_up_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Row(
                      children: [
                        Text(
                          "Date : 21 JAN 2024",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          "Seat : E2 E3 ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 60,
                        ),
                        Text("PRICE: 9,00\$",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.wallet,
                          color: Colors.white,
                        ),
                        Text(
                          " Online Payment",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    // heightFactor: 2,
                    child: ElevatedButton(
                      // onPressed: () async {
                      //   setState(() {
                      //     state = ButtonState.loading;
                      //   });
                      //   await Future.delayed(Duration(seconds: 3));
                      //   setState(() {
                      //     state = ButtonState.done;
                      //   });
                      //   await Future.delayed(Duration(seconds: 3));
                      //   setState(() {
                      //     state = ButtonState.init;
                      //   });
                      // },
                      onPressed: () async {
                        if (isLoading) return;
                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(Duration(seconds: 3));
                        setState(() {
                          isLoading = false;
                        });
                      },

                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(130, 40), // specify width, height
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                          20,
                        )),
                        backgroundColor: Colors.greenAccent,
                      ),
                      child: isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                  height: 10,
                                  width: 10,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Please wait...",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            )
                          : Text("Pay"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody3() {
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 50,
          shadowColor: Colors.yellow,
          color: Colors.orange,
          child: SizedBox(
            width: 350,
            height: 850, //850
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.network(
                    "https://th.bing.com/th/id/OIP.UdDwuK_Vw-howhWfBNXaQQHaK-?pid=ImgDet&rs=1",
                    height: 350,
                    width: 350,
                  ),
                  Text(
                    "What's Movie",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Divider(
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                    thickness: 5,
                    color: Colors.greenAccent,
                  ),
                  Container(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 230),
                    child: Text(
                      "INFO",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    height: 5,
                    indent: 15,
                    endIndent: 240,
                    thickness: 2,
                    color: Colors.greenAccent,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Row(
                      children: [
                        Text(
                          "THEATRE 3",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Container(
                          width: 150,
                        ),
                        Text(
                          "KH/--",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Icon(
                          Icons.volume_up_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Row(
                      children: [
                        Text(
                          "Date : 21 JAN 2024",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          "Seat : E2 E3 ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 60,
                        ),
                        Text("PRICE: 9,00\$",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.wallet,
                          color: Colors.white,
                        ),
                        Text(
                          " Online Payment",
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    // heightFactor: 2,
                    child: Container(
                      color: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIMG(MovieModels item) {
    return Image.network(item.image);
  }
}
