import 'package:flutter/material.dart';
import 'featured_edition_widget.dart';
import 'package:flutter/services.dart';
import 'package:reaali_poiss/src/rp_bloc.dart';
import 'package:reaali_poiss/frontpage_stories_widget.dart';
import 'package:reaali_poiss/styles.dart';
import 'package:reaali_poiss/screens/editions_screen.dart';
import 'package:reaali_poiss/screens/settings_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_modal/rounded_modal.dart';

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
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.grey[50],
    ));*/

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
  int _selectedIndex = 0;

  final List<List<Widget>> _pages = [
    <Widget>[
      SliverAppBar(
        title: Text(
          'Uudised',
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem>[
                PopupMenuItem(
                  child: Text(
                    'Vanad lehed',
                    style: drawerText,
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    'Seaded',
                    style: drawerText,
                  ),
                ),
              ];
            },
          ),
        ],
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage('assets/images/pilt.jpg'),
              )),
        ),
        floating: true,
        snap: true,
        elevation: 3,
      ),
      SliverList(
        delegate: SliverChildListDelegate(<Widget>[
          /*FeaturedEditionWidget(
                      editionId: 157,
                      editionMonth: 'Detsember',
                    ),*/
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text(
                  'Detsember',
                  style: h2Headline,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: 1,
                    items: <DropdownMenuItem>[
                      DropdownMenuItem(
                        child: Text(
                          'Uuemad',
                          style: drawerText,
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Loetumad',
                          style: drawerText,
                        ),
                        value: 2,
                      ),
                    ],
                    onChanged: (index) {},
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
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
    <Widget>[
      SliverAppBar(
        title: Text(
          'Kalender',
          style: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem>[
                PopupMenuItem(
                  child: Text(
                    'Vanad lehed',
                    style: drawerText,
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    'Seaded',
                    style: drawerText,
                  ),
                ),
              ];
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {},
        ),
        floating: true,
        snap: true,
        elevation: 3,
      ),
      SliverList(
        delegate: SliverChildListDelegate(<Widget>[
          /*FeaturedEditionWidget(
                      editionId: 157,
                      editionMonth: 'Detsember',
                    ),*/
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text(
                  'Detsember',
                  style: h2Headline,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: 1,
                    items: <DropdownMenuItem>[
                      DropdownMenuItem(
                        child: Text(
                          'Uuemad',
                          style: drawerText,
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Loetumad',
                          style: drawerText,
                        ),
                        value: 2,
                      ),
                    ],
                    onChanged: (index) {},
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
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
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = InheritedBloc.of(context).bloc;

    _showBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 4,
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
                    MaterialPageRoute(
                        builder: (context) =>
                            SettingsScreen(widget.darkThemeEnabled)),
                  );
                },
              ),
              SwitchListTile(
                title: Text(
                  'Öörežiim',
                  style: drawerText,
                ),
                onChanged: (bool value) {
                  bloc.changeTheme.add(value);
                },
                value: widget.darkThemeEnabled,
                activeColor: Theme.of(context).accentColor,
              ),
              Container(
                height: 8,
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        fixedColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper),
            title: Text('Uudised'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendarAlt),
            title: Text('Üritused'),
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
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: _pages[0],
            ),
          );
        },
      ),
    );
  }
}
