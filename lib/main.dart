import 'package:flutter/material.dart';
import 'package:reaali_poiss/src/rp_bloc.dart';
import 'package:reaali_poiss/styles.dart';
import 'package:flutter/services.dart';
import 'package:reaali_poiss/frontpage_stories_widget.dart';
import 'package:reaali_poiss/latest_edition_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.grey[50],
    ));

    return InheritedBloc(
      bloc: RPBloc(),
      child: MyStream(),
    );
  }
}

class MyStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: false,
      stream: InheritedBloc.of(context).bloc.darkThemeEnabled,
      builder: (context, snapshot) => MaterialApp(
            theme: snapshot.data ? darkTheme : lightTheme,
            home: MyHomePage(snapshot.data),
            debugShowCheckedModeBanner: false,
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final bool darkThemeEnabled;

  MyHomePage(this.darkThemeEnabled);

  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20, bottom: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Seaded',
                            style: h1Headline,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Kõik artiklid',
                            style: h1Headline,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Vanad väljaanded',
                            style: h1Headline,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 80, bottom: 20),
              child: Image.asset('assets/images/pilt2.jpg'),
            ),
            Container(
              alignment: Alignment(1, 0),
              padding: EdgeInsets.only(bottom: 60, right: 40),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MonthScreen()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'veebruar',
                        textAlign: TextAlign.right,
                        style: h1Headline.apply(fontSizeDelta: 12),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, top: 6),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[900],
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MonthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = InheritedBloc.of(context).bloc;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              elevation: 3,
              title: Text(
                'veebruar',
                style: h2Headline,
              ),
              centerTitle: true,
              snap: true,
              floating: true,
              pinned: false,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Builder(
                    builder: (BuildContext context) {
                      return RefreshIndicator(
                          backgroundColor: Colors.grey[50],
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
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 12,
                              ),
                              FrontpageStoriesWidget(),
                              Container(
                                height: 16.0,
                              ),
                            ],
                          ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}