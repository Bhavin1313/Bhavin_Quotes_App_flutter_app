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
  bool isToggled = true;
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
      drawer: Drawer(
        child: Column(
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff2ac9f0).withOpacity(.5),
        onPressed: () {
          setState(() {
            isToggled = !isToggled;
          });
        },
        child: Icon(
          (isToggled == true) ? Icons.grid_3x3 : Icons.list,
          color: Colors.black.withOpacity(.8),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "All Quotes",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
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
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: (isToggled == true)
          ? ListView.builder(
              itemCount: Global.QuotsData.length,
              itemBuilder: (BuildContext context, int i) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'detail_page',
                      arguments: Global.QuotsData[i]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 230,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v1016-c-08_1-ksh6mza3.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=f584d8501c27c5f649bc2cfce50705c0",
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff2ac9f0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "${Global.QuotsData[i].quote}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "- ${Global.QuotsData[i].author}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: Global.QuotsData.length,
              itemBuilder: (BuildContext context, int i) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'detail_page',
                      arguments: Global.QuotsData[i]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff2ac9f0),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://media.istockphoto.com/id/1248542684/vector/abstract-blurred-colorful-background.jpg?s=612x612&w=0&k=20&c=6aJX8oyUBsSBZFQUCJDP7KZ1y4vrf-wEH_SJsuq7B5I=",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            height: 90,
                            child: SingleChildScrollView(
                              child: Text(
                                "${Global.QuotsData[i].quote}",
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
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
                              "- ${Global.QuotsData[i].author}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
