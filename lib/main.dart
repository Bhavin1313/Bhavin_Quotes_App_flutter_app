import 'package:flutter/material.dart';

import 'Views/all_quotes.dart';
import 'Views/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orangeAccent),
      routes: {
        'all_Quotes': (context) => HomePage(),
        '/': (context) => All_Quotes(),
      },
    ),
  );
}
