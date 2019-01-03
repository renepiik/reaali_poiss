import 'package:flutter/material.dart';
import 'edition_stories_widget.dart';
import 'styles.dart';

class EditionView extends StatelessWidget {
  EditionView(this.editionMonth, this.editionId);

  final String editionMonth;
  final int editionId;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(height: 20,),
          Stack(
            alignment: Alignment(-0.7, 0.3),
            children: <Widget>[
              Container(
                color: Colors.lightBlue[100],
                height: 10,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Text(
                  editionMonth + ' $editionId',
                  style: h1Headline,
                ),
                alignment: Alignment(-1, 0),
              ),
            ],
          ),
          Container(height: 20,),
          EditionStoriesWidget(editionId: editionId,),
        ],
      ),
    );
  }
}