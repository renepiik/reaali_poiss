import 'package:flutter/material.dart';
import 'package:reaali_poiss/styles.dart';
import 'package:reaali_poiss/src/rp_bloc.dart';
import 'package:reaali_poiss/styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.darkThemeEnabled);

  final bool darkThemeEnabled;

  @override
  SettingsScreenState createState() {
    return new SettingsScreenState();
  }
}

class SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    final bloc = InheritedBloc.of(context).bloc;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seaded',
          style: h4Headline,
        ),
        elevation: 3,
      ),
      body: ListView(
        children: <Widget>[

        ],
      ),
    );
  }
}
