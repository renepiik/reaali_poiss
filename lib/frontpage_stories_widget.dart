import 'package:flutter/material.dart';
import 'package:reaali_poiss/src/article.dart';
import 'dart:collection';
import 'package:reaali_poiss/src/rp_bloc.dart';
import 'package:reaali_poiss/styles.dart';
import 'package:reaali_poiss/screens/article_screen.dart';
import 'dart:math';

class FrontpageStoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = InheritedBloc.of(context).bloc;

    return StreamBuilder<UnmodifiableListView<Article>>(
      stream: bloc.frontpageArticles,
      initialData: UnmodifiableListView<Article>([]),
      builder: (context, snapshot) {
        return Column(
          children: snapshot.data
              .map((article) => _storyWidget(context, article))
              .toList(),
        );
      },
    );
  }

  Widget _storyWidget(BuildContext context, Article article) {
    List<String> _images = [
      'assets/images/pilt.jpg',
      'assets/images/pilt2.jpg'
    ];
    Random r = Random();
    int i = r.nextInt(_images.length);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleScreen(
                        article: article,
                      )));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  article.title,
                  style: h4Headline,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 16, 0),
              height: 95.0,
              width: 95.0,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(5),
                color: Colors.grey[200],
                image: DecorationImage(
                  image: AssetImage(_images[i]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
