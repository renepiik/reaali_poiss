import 'package:flutter/material.dart';
import 'package:reaali_poiss/screens/edition_screen.dart';
import 'package:reaali_poiss/styles.dart';

class FeaturedEditionWidget extends StatelessWidget {
  final String editionMonth;
  final int editionId;

  FeaturedEditionWidget({@required this.editionMonth, @required this.editionId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditionScreen(editionMonth, editionId)),
        );
      },
      child: Stack(
        alignment: Alignment(0, 2.3),
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Hero(
              tag: 'fedcover',
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                    image: AssetImage('images/pilt3.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.grey[300],
                  boxShadow: [BoxShadow(
                    spreadRadius: 5,
                    color: Colors.grey[400],
                    blurRadius: 15,
                    offset: Offset(5, 5),
                  )],
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
          ),
          Hero(
            tag: 'fedtext',
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Stack(
                alignment: Alignment(-0.6, 0.3),
                children: <Widget>[
                  Container(
                    color: Colors.lightBlue[100],
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.72,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 8, 20, 20),
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        editionMonth + ' $editionId',
                        style: h1Headline,
                      ),
                    ),
                    alignment: Alignment(-0.8, 0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}