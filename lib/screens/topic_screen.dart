import 'package:flutter/material.dart';

class TopicScreen extends StatelessWidget {
  TopicScreen(this.topic);

  final String topic;

  @override
  Widget build(BuildContext context) {
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