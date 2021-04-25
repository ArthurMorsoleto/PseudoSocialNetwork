import 'package:flutter/material.dart';
import 'package:pseudo_social_network/model/comment.dart';
import 'package:pseudo_social_network/service/placeholder_service.dart';

class Comments extends StatelessWidget {
  final int postId;
  final PlaceHolderService _service = PlaceHolderService();

  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Comments"),
            centerTitle: true,
            brightness: Brightness.dark),
        body: Container(
            color: Colors.white70,
            child: FutureBuilder<List<Comment>>(
                future: _service.getPostComments(postId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("${snapshot.data[index].name}"),
                                  subtitle:
                                      Text("${snapshot.data[index].email}"),
                                ),
                                ListTile(
                                  title: Text("${snapshot.data[index].body}"),
                                ),
                              ],
                            ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("Error");
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.white70));
                  }
                })));
  }
}
