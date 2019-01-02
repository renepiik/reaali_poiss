import 'package:flutter/material.dart';
import 'topics_list_widget.dart';
import 'featured_edition_widget.dart';
import 'package:flutter/services.dart';
import 'src/rp_bloc.dart';
import 'frontpage_stories_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.grey[50],
    ));
    return InheritedBloc(
      bloc: RPBloc(),
      child: MaterialApp(
        title: 'Reaali Poiss',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryColor: Colors.grey[50],
          fontFamily: 'Montserrat'
        ),
        home: MyHomePage(title: 'Reaali Poiss'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage('images/pilt.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text('Saada ütlus'),
              leading: Icon(Icons.message),
              onTap: () {},
            ),
            ListTile(
              title: Text('Seaded'),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
        },
        child: ListView(
          children: <Widget>[
            FeaturedEditionWidget(),
            TopicsListWidget(),
            FrontpageStoriesWidget(),
            Container(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}