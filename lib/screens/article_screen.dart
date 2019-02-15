import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:reaali_poiss/styles.dart';
import 'package:reaali_poiss/src/article.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

class ArticleScreen extends StatefulWidget {
  final Article article;

  const ArticleScreen({Key key, @required this.article}) : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  String time;

  @override
  Widget build(BuildContext context) {
    String mdBody = html2md.convert(widget.article.body);

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
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            title: Text(''),
            pinned: false,
            snap: true,
            floating: true,
            elevation: 3,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  height: MediaQuery.of(context).size.width * 0.56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.article.topic.toUpperCase(),
                            style: topicText,
                          ),
                          Container(
                            height: 8,
                          ),
                          Text(
                            time,
                            style: topicText,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.heart,
                              color: Colors.grey[800],
                            ),
                          ),
                          Text(
                            widget.article.likes,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            width: 12,
                          ),
                          IconButton(
                            onPressed: () {
                              Share.share('https://rene.piik.eu/article/?id='+widget.article.id.toString());
                            },
                            icon: Icon(
                              Icons.share,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
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
                  child: MarkdownBody(
                    data: mdBody,
                    styleSheet: MarkdownStyleSheet(
                      p: bodyText,
                      strong: TextStyle(fontWeight: FontWeight.bold),
                      em: TextStyle(fontStyle: FontStyle.italic),
                      blockSpacing: 24,
                    ),
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
                            image: NetworkImage(
                                'https://amp.businessinsider.com/images/5899ffcf6e09a897008b5c04-750-750.jpg'),
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
                Container(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
