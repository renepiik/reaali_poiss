import 'package:flutter/material.dart';

class TopicView extends StatelessWidget {
  TopicView(this.topic);

  final String topic;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(topic),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Text(topic),
    );
  }
}