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
      backgroundColor: Color(0xff2ac9f0).withOpacity(1),
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
        backgroundColor: Color(0xff2ac9f0),
        centerTitle: true,
        title: Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
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
              color: Colors.white,
            ),
          )
        ],
      ),
      body: (isToggled == true)
          ? ListView.builder(
              itemCount: Global.QuotsData.length,
              itemBuilder: (BuildContext context, int i) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.pexels.com/photos/2570389/pexels-photo-2570389.jpeg?cs=srgb&dl=pexels-paulo-carvalho-2570389.jpg&fm=jpg",
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
                      CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(
                          "https://animatelogo.com/wp-content/uploads/2022/07/Get-a-quote-free.gif",
                        ),
                      ),
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
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: Global.QuotsData.length,
              itemBuilder: (BuildContext context, int i) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff2ac9f0),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://w0.peakpx.com/wallpaper/366/693/HD-wallpaper-underwater-bubbles-water-theme.jpg",
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
    );
  }
}
