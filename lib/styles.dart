import 'package:flutter/material.dart';

TextStyle h1Headline = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
  //color: Color(0xff414247),
  //decoration: TextDecoration.underline,
);

TextStyle h2Headline = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
  fontSize: 24,
  color: Color(0xff414247),
);

TextStyle h3Headline = TextStyle(
  fontFamily: 'Merriweather',
  fontSize: 20.0,
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.italic,
);

TextStyle h4Headline = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Color(0xff414247),
);

TextStyle authorText = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  fontFamily: 'Open Sans',
);

TextStyle bodyText = TextStyle(
  fontFamily: 'Open Sans',
  fontSize: 18,
  height: 1.1,
  fontWeight: FontWeight.w500,
  color: Colors.grey[800],
);

TextStyle drawerText = TextStyle(
  fontFamily: 'Libre Franklin',
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Colors.grey[700],
);

TextStyle bottomNavText = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
);

TextStyle topicText = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 14,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.9,
  color: Colors.grey[600],
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: Colors.grey[50],
  accentColor: Colors.orange,
  brightness: Brightness.light,
  fontFamily: 'Montserrat',
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  accentColor: Colors.orange,
  colorScheme: ColorScheme.dark(),
  fontFamily: 'Montserrat',
  brightness: Brightness.dark,
);
