import 'package:flutter/material.dart';
import 'package:quiz_u/app/screens/home/home.dart';
import 'package:get/get.dart';

import 'name_controller.dart';
class NameScreen extends GetView<NameController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text(
                          "Quiz U ⏳",
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children:  <Widget>[
                              const Text(
                                "What's your name?",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextField(
                                keyboardType: TextInputType.text,
                                onChanged: (name)=>{controller.updateName(name)},
                                decoration: const InputDecoration(
                                    fillColor: Color(0xfff3f3f4), filled: true),
                              ),
                            ]),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black87,
                            backgroundColor: Colors.grey,
                            minimumSize: Size(88, 46),
                            textStyle: TextStyle(fontSize: 26),
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(2.0)),
                            ),
                          ),
                          onPressed: () async => {
                            controller.submitName()
                          },
                          child: Text('Done'),
                        ),
                      ],
                    )))));
  }
}
