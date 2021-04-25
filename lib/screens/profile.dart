import 'package:flutter/material.dart';
import 'package:pseudo_social_network/components/drawer.dart';
import 'package:pseudo_social_network/model/user.dart';

class Profile extends StatelessWidget {
  final User user;

  Profile(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Profile"),
            centerTitle: true,
            brightness: Brightness.dark),
        drawer: CustomDrawer(),
        body: Column(children: [
          Expanded(
              child: Card(
                  margin: EdgeInsets.all(16),
                  elevation: 10,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                                child: Text(
                              user.name,
                              style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo),
                            ))),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'username: ${user.username}',
                              style: TextStyle(fontSize: 18),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'email: ${user.email}',
                              style: TextStyle(fontSize: 18),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'phone: ${user.phone}',
                              style: TextStyle(fontSize: 18),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'website: ${user.website}',
                              style: TextStyle(fontSize: 18),
                            ))
                      ]))),
          Expanded(
              child: Card(
                  margin: EdgeInsets.all(16),
                  elevation: 10,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                              child: Text('Address',
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo))),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text('street: ${user.address.street}',
                                style: TextStyle(fontSize: 18))),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text('suite: ${user.address.suite}',
                                style: TextStyle(fontSize: 18))),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text('city: ${user.address.city}',
                                style: TextStyle(fontSize: 18))),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text('zipcode: ${user.address.zipcode}',
                                style: TextStyle(fontSize: 18)))
                      ])))
        ]));
  }
}
