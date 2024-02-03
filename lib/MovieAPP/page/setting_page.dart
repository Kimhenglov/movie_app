import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pp/MovieAPP/page_detail/setting_page_detail.dart';

class Setting_page extends StatefulWidget {
  const Setting_page({super.key});

  @override
  State<Setting_page> createState() => _Setting_pageState();
}

class _Setting_pageState extends State<Setting_page> {
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
        "Setting",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  Widget _buildBody() {
    return Container(
      //padding: EdgeInsets.all(20),
      color: Colors.white,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 15),
            child: Text(
              "Languages",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ExpansionTile(
            collapsedBackgroundColor: Colors.white24,
            leading: Icon(
              Icons.language,
              color: Colors.black,
              size: 20,
            ),
            title: Text(
              "Choose language",
            ),
            children: [
              ListTile(
                title: Text(
                  "Khmer",
                  style: TextStyle(fontSize: 15),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.tick_circle,
                    color: Colors.greenAccent,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "China",
                  style: TextStyle(fontSize: 15),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.tick_circle),
                ),
              ),
              ListTile(
                title: Text(
                  "Thai",
                  style: TextStyle(fontSize: 15),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Iconsax.tick_circle),
                ),
              ),
            ],
          ),
          //////

          Padding(
            padding: const EdgeInsets.only(left: 17, top: 15),
            child: Text(
              "Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(
              Iconsax.personalcard,
              color: Colors.black,
              size: 20,
            ),
            title: Text(
              "Choose language",
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting_page_detail(),
                ),
              );
            },
          ),

          //////
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 15),
            child: Text(
              "What's new ?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          ExpansionTile(
            collapsedBackgroundColor: Colors.white24,
            leading: Icon(
              Iconsax.security_card,
              color: Colors.black,
              size: 20,
            ),
            title: Text(
              "Choose language",
            ),
            children: [
              Text(
                "New version has been releases",
              )
            ],
          ),
        ],
      ),
    );
  }
}
