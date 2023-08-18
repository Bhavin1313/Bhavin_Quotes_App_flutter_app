import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import '../Utils/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
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
                        TextFormField(
                          onSaved: (val) {
                            Global.name = val;
                          },
                          controller: Global.namec,
                          decoration: InputDecoration(
                            hintText: "name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onSaved: (val) {
                            Global.email = val!;
                          },
                          decoration: InputDecoration(
                            hintText: "email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          controller: Global.emailc,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            formKey.currentState!.save();
                            Navigator.pushReplacementNamed(
                                context, 'all_Quotes');
                          },
                          child: const Text("Submit"),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Global.namec.clear();
                              Global.emailc.clear();
                              setState(() {});
                            },
                            child: const Text("Clear.."))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
