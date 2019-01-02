import 'package:flutter/material.dart';
import 'topic_view.dart';
import 'styles.dart';

List<String> teemad = ['Veerg', 'EV100', 'Kuu küsimus', 'Kultuur', 'Ajalgu', 'Väike maja', 'Retsept', 'Ütlused'];

class TopicsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.0),
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        itemBuilder: (context, position) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[400],
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                child: Container(
                  width: 160.0,
                  child: Center(
                    child: Text(teemad[position], style: secondaryHeading,),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TopicView(teemad[position])),
                  );
                },
              ),
            ),
          );
        },
        itemCount: teemad.length,
      ),
    );
  }
}