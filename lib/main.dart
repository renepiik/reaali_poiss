import 'package:flutter/material.dart';
import 'featured_edition_widget.dart';
import 'package:flutter/services.dart';
import 'package:reaali_poiss/src/rp_bloc.dart';
import 'package:reaali_poiss/src/article.dart';
import 'package:reaali_poiss/frontpage_stories_widget.dart';
import 'package:reaali_poiss/styles.dart';
import 'package:reaali_poiss/chips_widget.dart';
import 'package:reaali_poiss/screens/editions_screen.dart';
import 'package:reaali_poiss/screens/settings_screen.dart';
import 'package:reaali_poiss/screens/article_screen.dart';

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
            fontFamily: 'Merriweather'),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'Reaali Poiss'),
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
                  MaterialPageRoute(builder: (context) => EditionsScreen()),
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
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
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
                    floating: true,
                    snap: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                      ChipsWidget(),
                      FeaturedEditionWidget(),
                      Container(
                        height: 12,
                      ),
                      FrontpageStoriesWidget(),
                      Container(
                        height: 16.0,
                      ),
                    ]),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
