import 'package:flutter/material.dart';
import 'package:pseudo_social_network/components/drawer.dart';
import 'package:pseudo_social_network/service/placeholder_service.dart';

import 'comments.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  PlaceHolderService _service = PlaceHolderService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Feed"),
            centerTitle: true,
            brightness: Brightness.dark),
        drawer: CustomDrawer(),
        body: Container(
          color: Colors.indigo,
          child: FutureBuilder(
            future: _service.getPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Comments(snapshot.data[index].id)));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(
                                    snapshot.data[index].title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  subtitle: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(snapshot.data[index].body,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 16)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("Error");
              }
              return Center(
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.white));
            },
          ),
        ));
  }
}
