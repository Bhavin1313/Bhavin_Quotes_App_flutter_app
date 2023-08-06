import 'dart:math';

import 'package:flutter/material.dart';

import '../Components/Utils/global.dart';
import '../Components/Utils/list_quotes.dart';
import '../Model/quotes_model.dart';

class All_Quotes extends StatefulWidget {
  const All_Quotes({super.key});

  @override
  State<All_Quotes> createState() => _All_QuotesState();
}

class _All_QuotesState extends State<All_Quotes> {
  Random random = Random();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Global.QuotsData = QuoteList.map((e) => Quotes.fromMap(Data: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    int RandomIndex = random.nextInt(Global.QuotsData.length);
    Quotes quotes = Global.QuotsData[RandomIndex];
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      elevation: 5,
                      title: Text("${quotes.quote}"),
                      content: Text("- ${quotes.author}"),
                    ),
                  );
                });
              },
              icon: Icon(
                Icons.refresh,
              ),
            )
          ],
        ),
        body: Center(
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'all_Quotes');
            },
            child: Text("All Quots"),
          ),
        ));
  }
}
