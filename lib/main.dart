import 'package:flutter/material.dart';
import 'featured_edition_widget.dart';
import 'package:flutter/services.dart';
import 'src/rp_bloc.dart';
import 'frontpage_stories_widget.dart';
import 'styles.dart';
import 'chips_widget.dart';
import 'all_editions_view.dart';
import 'settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      //systemNavigationBarColor: Colors.grey[50],
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      //statusBarColor: Colors.grey[50],
    ));
    return InheritedBloc(
      bloc: RPBloc(),
      child: MaterialApp(
        title: 'Reaali Poiss',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryColor: Colors.grey[50],
          fontFamily: 'Merriweather'
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
    final bloc = InheritedBloc.of(context).bloc;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Reaali Poiss',
                style: h3Headline,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
            ),
            ListTile(
              title: Text(
                'Vanad lehed',
                style: drawerText,
              ),
              leading: Icon(Icons.book),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllEditionsView()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Seaded',
                style: drawerText,
              ),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Reaali Poiss',
          style: h3Headline,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return RefreshIndicator(
            onRefresh: () async {
              bloc.frontpageRefresh.add(true);

              await for (bool value in bloc.isLoading) {
                if (!value) {
                  return Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Uuendatud'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              }
            },
            child: ListView(
              children: <Widget>[
                ChipsWidget(),
                FeaturedEditionWidget(),
                Container(height: 12,),
                FrontpageStoriesWidget(),
                Container(height: 16.0,),
              ],
            ),
          );
        },
      ),
    );
  }
}