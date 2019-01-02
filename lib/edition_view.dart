import 'package:flutter/material.dart';
import 'stories_list_widget.dart';
import 'package:reaali_poiss/src/rp_bloc.dart';

class EditionView extends StatelessWidget {
  EditionView(this.edition);

  final String edition;

  @override
  Widget build(BuildContext context) {
    //final bloc = InheritedBloc.of(context).bloc;
    //bloc.storiesType.add(StoriesType.editionStories);

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
      body: StoriesListWidget(
        storiesType: StoriesType.editionStories,
      ),
    );
  }
}