import 'package:flutter/material.dart';

TextStyle h1Headline = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 36.0,
  fontWeight: FontWeight.bold,
  //decoration: TextDecoration.underline,
);

TextStyle h2Headline = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w700,
  fontSize: 28,
);

TextStyle h3Headline = TextStyle(
  fontFamily: 'Merriweather',
  fontSize: 20.0,
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.italic,
);

TextStyle h4Headline = TextStyle(
  fontFamily: 'Libre Franklin',
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

TextStyle authorText = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
  fontFamily: 'Merriweather'
);

TextStyle bodyText = TextStyle(
  fontFamily: 'Open Sans',
  fontSize: 17,
  height: 1.1,
  fontWeight: FontWeight.w500,
);

TextStyle drawerText = TextStyle(
  fontFamily: 'Libre Franklin',
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: Colors.grey[700],
);

TextStyle quoteText = TextStyle(
  fontFamily: 'Merriweather',
  fontSize: 16,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.italic,
  color: Colors.grey[800]
);

TextStyle topicText = TextStyle(
  fontFamily: 'Libre Franklin',
  fontSize: 14,
  fontWeight: FontWeight.w700,
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  primaryColor: Colors.grey[50],
  brightness: Brightness.light,
  fontFamily: 'Merriweather',
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  accentColor: Colors.orange,
  colorScheme: ColorScheme.dark(),
  fontFamily: 'Merriweather',
  brightness: Brightness.dark,
);