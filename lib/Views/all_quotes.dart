import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Components/Utils/global.dart';
import '../Components/Utils/list_quotes.dart';
import '../Model/quotes_model.dart';

class All_Quotes extends StatefulWidget {
  const All_Quotes({super.key});

  @override
  State<All_Quotes> createState() => _All_QuotesState();
}

class _All_QuotesState extends State<All_Quotes> {
  XFile? image;
  final ImagePicker picker = ImagePicker();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
          title: const Text("Home Page"),
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
              icon: const Icon(
                Icons.refresh,
              ),
            )
          ],
        ),
        body: Center(
            child: Column(
          children: [
            Form(
              key: formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                "Pick an Image",
                                style: TextStyle(fontSize: 16),
                              ),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        // Capture a photo.
                                        image = await picker.pickImage(
                                            source: ImageSource.camera);
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.camera_alt)),
                                  IconButton(
                                      onPressed: () async {
                                        image = await picker.pickImage(
                                            source: ImageSource.gallery);
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.photo))
                                ],
                              ),
                            ),
                          );
                        },
                        child: (image == null)
                            ? Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://media.newyorker.com/photos/59095c501c7a8e33fb38c107/master/w_2560%2Cc_limit/Monkey-Selfie-DailyShouts.jpg"),
                                      fit: BoxFit.cover),
                                ),
                              )
                            : Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: FileImage(
                                        File(
                                          "${image?.path}",
                                        ),
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                      ),
                      const SizedBox(),
                      TextFormField(
                        onSaved: (val) {
                          Global.name = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Name First";
                          }
                        },
                        controller: Global.nameController,
                        decoration: const InputDecoration(hintText: "name"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onSaved: (val) {
                          Global.email = val;
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Email First";
                          }
                        },
                        decoration: const InputDecoration(hintText: "email"),
                        controller: Global.emailController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Data is Saved...."),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pushNamed(context, 'all_Quotes');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Data is Missing",
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: const Text("Submit"),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Global.nameController.clear();
                            Global.emailController.clear();
                            image = null;
                            setState(() {});
                          },
                          child: const Text("Clear.."))
                    ],
                  ),
                ),
              ),
            )
          ],
        )));
  }
}
