import 'package:flutter/material.dart';
import 'styles.dart';
import 'src/article.dart';

class ArticleView extends StatefulWidget {
  final Article article;

  const ArticleView({Key key, this.article}) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  String time;

  @override
  Widget build(BuildContext context) {
    final timestamp = widget.article.timestamp;

    if (timestamp.day == DateTime.now().day) {
      time = 'Täna';
    } else if (timestamp.day ==
        DateTime.now().subtract(Duration(days: 1)).day) {
      time = 'Eile';
    } else {
      time = timestamp.day.toString() +
          '.' +
          timestamp.month.toString() +
          '.' +
          timestamp.year.toString();
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
                  image: AssetImage('images/pilt2.jpg'), fit: BoxFit.cover),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.article.topic.toUpperCase(),
                        style: topicText,
                      ),
                      Text(
                        time,
                        style: topicText.apply(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
                  child: Text(
                    widget.article.title,
                    style: h2Headline,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://amp.businessinsider.com/images/5899ffcf6e09a897008b5c04-750-750.jpg'),
                          ),
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[300],
                        ),
                        height: 60,
                        width: 60,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Text(
                          widget.article.author,
                          style: authorText,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                  child: Text(
                    widget.article.text,
                    style: bodyText,
                  ),
                ),
                Container(height: 20,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
