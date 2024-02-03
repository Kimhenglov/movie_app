import 'package:flutter/material.dart';

class Setting_page_detail extends StatefulWidget {
  const Setting_page_detail({super.key});

  @override
  State<Setting_page_detail> createState() => _Setting_page_detailState();
}

class _Setting_page_detailState extends State<Setting_page_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "Account",
        style: TextStyle(
          color: Colors.black,
        ),
        //style: TextStyle(fontSize: 10),
      ),
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  Widget _buildBody() {
    return Container();
  }
}
