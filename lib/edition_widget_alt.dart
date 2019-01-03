import 'package:flutter/material.dart';
import 'package:reaali_poiss/screens/edition_view.dart';
import 'styles.dart';

class EditionWidget extends StatelessWidget {
  final String editionMonth;
  final int editionId;

  EditionWidget({@required this.editionMonth, @required this.editionId});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditionView(editionMonth, editionId)),
          );
        },
        child: Column(
          children: <Widget>[
            Container(
              //margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(
                  image: AssetImage('images/pilt3.jpg'),
                  fit: BoxFit.cover,
                ),
                color: Colors.grey[300],
              ),
              width: double.infinity,
              height: 250.0,
            ),
            Stack(
              alignment: Alignment(-0.6, 0.3),
              children: <Widget>[
                Container(
                  color: Colors.lightBlue[100],
                  height: 10,
                  width: MediaQuery.of(context).size.width * 0.72,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 8, 20, 20),
                  child: Text(
                    editionMonth + ' $editionId',
                    style: h1Headline,
                  ),
                  alignment: Alignment(-0.8, 0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
