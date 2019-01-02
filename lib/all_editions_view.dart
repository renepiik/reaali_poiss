import 'package:flutter/material.dart';
import 'edition_widget.dart';

class AllEditionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Vanemad lehed'),
            pinned: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: EditionWidget(editionMonth: 'Detsember', editionId: 157,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: EditionWidget(editionMonth: 'November', editionId: 156,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 28.0),
                  child: EditionWidget(editionMonth: 'Oktoober', editionId: 155,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}