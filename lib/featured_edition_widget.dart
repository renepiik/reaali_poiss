import 'package:flutter/material.dart';
import 'edition_widget.dart';
//import 'all_editions_view.dart';

class FeaturedEditionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        EditionWidget(editionMonth: 'Detsember', editionId: 157,),
        /*
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllEditionsView()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[400],
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                'Vanemad lehed',
                style: TextStyle(
                    fontSize: 16.0
                ),
              ),
            ),
          ),
        ),
        */
      ],
    );
  }
}