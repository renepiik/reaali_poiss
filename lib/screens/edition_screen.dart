import 'package:flutter/material.dart';
import 'package:reaali_poiss/edition_stories_widget.dart';
import 'package:reaali_poiss/styles.dart';

class EditionScreen extends StatefulWidget {
  EditionScreen(this.editionMonth, this.editionId);

  final String editionMonth;
  final int editionId;

  @override
  EditionScreenState createState() {
    return new EditionScreenState();
  }
}

class EditionScreenState extends State<EditionScreen> {
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            child: Stack(
              alignment: Alignment(0, 0.8),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20, 60, 20, 32),
                  child: Hero(
                    tag: 'fedcover',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                          image: AssetImage('images/pilt3.jpg'),
                          fit: BoxFit.cover,
                        ),
                        /*boxShadow: [
                          BoxShadow(
                            spreadRadius: 5,
                            color: Colors.grey[400],
                            blurRadius: 15,
                            offset: Offset(5, 5),
                          )
                        ],*/
                      ),
                    ),
                  ),
                ),
                Hero(
                  tag: 'fedtext',
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Stack(
                      alignment: Alignment(-0.4, 0.17),
                      children: <Widget>[
                        Container(
                          color: Colors.lightBlue[100],
                          height: 10,
                          width: MediaQuery.of(context).size.width * 0.7,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 8, 20, 20),
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              widget.editionMonth + ' ${widget.editionId}',
                              style: h1Headline,
                            ),
                          ),
                          alignment: Alignment(-0.8, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: IconButton(
                    iconSize: 52,
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey[200],
                    ),
                    onPressed: () {
                      setState(() {
                        controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                        );
                      });
                    },
                  ),
                  right: 24,
                  top: MediaQuery.of(context).size.height * 0.45,
                ),
              ],
            ),
          ),
          Container(
            child: EditionStoriesWidget(
              editionId: widget.editionId,
            ),
          ),
        ],
      ),
    );

    /*return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: <Widget>[
          */ /*SliverAppBar(
            title: _stack(context),
            snap: true,
            elevation: 3,
            floating: true,
          ),*/ /*
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Hero(
                tag: 'fedcover',
                child: Container(
                  //margin: EdgeInsets.fromLTRB(12, 0, 12, 32),
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                      image: AssetImage('images/pilt3.jpg'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[300],
                    */ /*boxShadow: [BoxShadow(
                      spreadRadius: 5,
                      color: Colors.grey[400],
                      blurRadius: 15,
                      offset: Offset(5, 5),
                    )],*/ /*
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
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
              Container(
                width: MediaQuery.of(context).size.width,
                child: EditionStoriesWidget(
                  editionId: editionId,
                ),
              ),
            ]),
          ),
        ],
      ),
    );*/

    /*return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(height: 20,),
          Stack(
            alignment: Alignment(-0.7, 0.3),
            children: <Widget>[
              Container(
                color: Colors.lightBlue[100],
                height: 10,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Text(
                  editionMonth + ' $editionId',
                  style: h1Headline,
                ),
                alignment: Alignment(-1, 0),
              ),
            ],
          ),
          Container(height: 20,),
          EditionStoriesWidget(editionId: editionId,),
        ],
      ),
    );*/
  }
}
