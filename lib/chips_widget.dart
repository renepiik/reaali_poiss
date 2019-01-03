import 'package:flutter/material.dart';
import 'package:reaali_poiss/screens/topic_view.dart';

List<String> teemad = [
  'Veerg',
  'EV100',
  'Kuu küsimus',
  'Kultuur',
  'Ajalgu',
  'Väike maja',
  'Retsept',
  'Ütlused'
];

class ChipsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      height: 64,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, position) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: ActionChip(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TopicView(teemad[position])));
              },
              label: Text('#' + teemad[position]),
              padding: EdgeInsets.all(6),
              pressElevation: 0,
              backgroundColor: Colors.grey[200],
            ),
          );
        },
        itemCount: teemad.length,
      ),
    );
  }
}
