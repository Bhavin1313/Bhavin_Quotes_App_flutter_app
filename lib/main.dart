import 'package:flutter/material.dart';

import 'Views/all_quotes.dart';
import 'Views/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color(0xff2ac9f0),
      ),
      routes: {
        '/': (context) => HomePage(),
        'all_Quotes': (context) => All_Quotes(),
      },
    ),
  );
}
