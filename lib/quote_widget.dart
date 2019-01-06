import 'package:flutter/material.dart';
import 'package:reaali_poiss/styles.dart';

class QuoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 8, 24, 32),
      child: Text(
        'M. Saar: "Kõikide kordamistöölehtede lahendajate vahel loosime välja teflonpõhjaga panni."',
        style: quoteText,
      ),
    );
  }
}
