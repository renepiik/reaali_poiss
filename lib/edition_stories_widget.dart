import 'package:flutter/material.dart';
import 'package:reaali_poiss/src/article.dart';
import 'dart:collection';
import 'package:reaali_poiss/src/rp_bloc.dart';
import 'styles.dart';
import 'article_view.dart';

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
          children: snapshot.data.map((article) => _storyWidget(context, article)).toList(),
        );
      },
    );
  }

  Widget _storyWidget(BuildContext context, Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArticleView(article: article))
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(16, 8, 20, 8),
            height: 90.0,
            width: 90.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage('images/pilt2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                article.title,
                style: secondaryHeading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}