import 'package:flutter/material.dart';
import 'package:reaali_poiss/edition_stories_widget.dart';
import 'package:reaali_poiss/styles.dart';

// TODO: implement custom sliverview

class EditionScreen extends StatelessWidget {
  EditionScreen(this.editionMonth, this.editionId);

  final String editionMonth;
  final int editionId;

  Widget _stack(BuildContext context) {
    return Stack(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: _stack(context),
            snap: true,
            elevation: 3,
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                height: 20,
              ),
              EditionStoriesWidget(
                editionId: editionId,
              ),
            ]),
          ),
        ],
      ),
    );

    /*return Scaffold(
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
    );*/
  }
}
