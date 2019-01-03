import 'package:flutter/material.dart';
import 'package:reaali_poiss/src/article.dart';
import 'dart:collection';
import 'package:reaali_poiss/src/rp_bloc.dart';
import 'package:reaali_poiss/styles.dart';
import 'package:reaali_poiss/screens/article_screen.dart';

class EditionStoriesWidget extends StatelessWidget {
  final int editionId;

  EditionStoriesWidget({this.editionId});

  @override
  Widget build(BuildContext context) {
    final bloc = InheritedBloc.of(context).bloc;
    bloc.editionId.add(editionId);

    return StreamBuilder<UnmodifiableListView<Article>>(
      stream: bloc.editionArticles,
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
                    builder: (context) => ArticleScreen(article: article)));
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
                margin:
                    EdgeInsets.fromLTRB(20, 8, 12, 8).add(EdgeInsets.all(5)),
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
