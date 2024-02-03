import 'package:flutter/material.dart';

class HomePage_Detail extends StatefulWidget {
  const HomePage_Detail({super.key});

  @override
  State<HomePage_Detail> createState() => _HomePage_DetailState();
}

class _HomePage_DetailState extends State<HomePage_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      //elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "Movie Name",
        style: TextStyle(color: Colors.black),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.greenAccent,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
