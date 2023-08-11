import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/Model/quotes_model.dart';

import '../Components/Utils/global.dart';

class Detail_Page extends StatefulWidget {
  const Detail_Page({super.key});

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {
  void CopytoClipBord({required String data}) {
    Clipboard.setData(ClipboardData(text: data));
  }

  @override
  Widget build(BuildContext context) {
    Quotes data = ModalRoute.of(context)!.settings.arguments as Quotes;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Quotes"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              CopytoClipBord(data: "${data.quote}");
            },
            icon: Icon(
              Icons.copy,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                Global.fontFamily = "Roboto";
                Global.fontColor = Colors.black;
                Global.bgColor = Colors.white;
                Global.bgImage = "";
              });
            },
            icon: Icon(
              Icons.restart_alt,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              padding: EdgeInsets.all(15),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Global.bgColor,
                image: DecorationImage(
                  image: NetworkImage(Global.bgImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SelectableText(
                    "${data.quote}",
                    style: GoogleFonts.getFont(Global.fontFamily)
                        .copyWith(fontSize: 20, color: Global.fontColor),
                  ),
                  SelectableText(
                    "- ${data.author}",
                    style: GoogleFonts.getFont(Global.fontFamily)
                        .copyWith(fontSize: 18, color: Global.fontColor),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Global.bgColorList
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            Global.bgColor = e;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(18),
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: e,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Background Color",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Global.bgColorList
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            Global.fontColor = e;
                          });
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: e,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Text Color",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Global.fontFamilyList
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            Global.fontFamily = e;
                          });
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "A a",
                            style: GoogleFonts.getFont(e).copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Global.bgImageList
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            Global.bgImage = e;
                          });
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(e),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
