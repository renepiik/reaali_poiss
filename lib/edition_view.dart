import 'package:flutter/material.dart';
import 'edition_stories_widget.dart';

class EditionView extends StatelessWidget {
  EditionView(this.edition, this.editionId);

  final String edition;
  final int editionId;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(edition),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          EditionStoriesWidget(editionId: editionId,),
        ],
      ),
    );
  }
}