import 'package:flutter/material.dart';
import 'styles.dart';
import 'src/article.dart';

class ArticleView extends StatelessWidget {
  final Article article;
  String time;

  ArticleView({@required this.article});

  @override
  Widget build(BuildContext context) {
    if (article.timestamp.day == DateTime.now().day) {
      time = 'Täna';
    } else if (article.timestamp.day == DateTime.now().subtract(Duration(days: 1)).day) {
      time = 'Eile';
    } else {
      time = article.timestamp.day.toString() + '.' + article.timestamp.month.toString() + '.' + article.timestamp.year.toString();
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Reaali Poiss'),
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                  image: AssetImage('images/pilt2.jpg'),
                  fit: BoxFit.cover
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                  child: Text(
                    article.title,
                    style: primaryHeading,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        article.topic.toUpperCase(),
                        style: TextStyle(
                            fontSize: 18.0
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                            fontSize: 18.0
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                      child: Text(
                        article.text,
                        style: bodyText,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 20),
                  child: Text(
                    'Autor: '+article.author,
                    style: bodyText.apply(fontWeightDelta: 3),
                  ),
                ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}