import 'package:flutter/material.dart';
import 'package:reaali_poiss/frontpage_stories_widget.dart';
import 'package:reaali_poiss/latest_edition_widget.dart';

class FrontPageView extends StatefulWidget {
  @override
  _FrontPageViewState createState() => _FrontPageViewState();
}

class _FrontPageViewState extends State<FrontPageView> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Container(
                height: 12,
              ),
              LatestEditionWidget(),
              FrontpageStoriesWidget(),
              Container(
                height: 16.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
