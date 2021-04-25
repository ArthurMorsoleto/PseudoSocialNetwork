import 'package:flutter/material.dart';
import 'package:pseudo_social_network/screens/Feed.dart';
import 'package:pseudo_social_network/screens/profile.dart';
import 'package:pseudo_social_network/service/placeholder_service.dart';

class CustomDrawer extends StatelessWidget {
  final PlaceHolderService _service = PlaceHolderService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Image.asset("assets/logo.png")),
          ListTile(
            title: Text(
              "Profile",
              style: TextStyle(fontSize: 24),
            ),
            onTap: () {
              _service.getUserProfile().then((user) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Profile(user)));
              });
            },
          ),
          ListTile(
            title: Text(
              "Feed",
              style: TextStyle(fontSize: 24),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Feed()));
            },
          ),
        ],
      ),
    );
  }
}
