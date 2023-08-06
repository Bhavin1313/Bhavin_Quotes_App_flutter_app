import 'package:flutter/material.dart';
import 'package:quotes_app/Components/Utils/list_quotes.dart';

import '../Components/Utils/global.dart';
import '../Model/quotes_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Global.QuotsData = QuoteList.map((e) => Quotes.fromMap(Data: e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    int counter = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Global.QuotsData.map(
            (e) => Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "${counter++}. ${e.quote}",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Autor :- ${e.author}",
                        style: TextStyle(fontSize: 10, color: Colors.blueGrey),
                      ),
                    ),
                  ),
                ],
              ),
              elevation: 2,
            ),
          ).toList(),
        ),
      ),
    );
  }
}
