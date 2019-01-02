import 'package:flutter/material.dart';
import 'edition_view.dart';
import 'styles.dart';

class EditionWidget extends StatelessWidget {
  final String editionMonth;
  final int editionId;

  EditionWidget({@required this.editionMonth, @required this.editionId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditionView(editionMonth)),
        );
      },
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage('images/pilt3.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 250.0,
              width: double.infinity,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              editionMonth+' '+editionId.toString(),
              style: primaryHeading,
            ),
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}