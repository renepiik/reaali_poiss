import 'package:flutter/material.dart';
import 'package:reaali_poiss/src/article.dart';
import 'dart:collection';
import 'package:reaali_poiss/src/rp_bloc.dart';
import 'package:reaali_poiss/styles.dart';
import 'package:reaali_poiss/screens/article_view.dart';

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
    return Column(
      children: <Widget>[
        Container(
          height: 1,
          color: Colors.grey[200],
          width: MediaQuery.of(context).size.width * 0.96,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArticleView(article: article)));
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
                margin: EdgeInsets.fromLTRB(20, 8, 12, 8).add(EdgeInsets.all(5)),
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  image: DecorationImage(
                    image: AssetImage('images/pilt2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
