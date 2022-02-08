// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:flutter/material.dart';

import 'constants.dart';
import 'events.dart';

void main() {
  runApp(MyApp());
}

TextStyle style = const TextStyle(color: Colors.white);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timeline',
      theme: ThemeData(
        primaryColor: Constants.kPurpleColor,
      ),
      home: TimelineComponent(title: 'Timeline'),
    );
  }
}

class TimelineComponent extends StatelessWidget {
  TimelineComponent({Key? key, this.title}) : super(key: key);

  final String? title;

  final List<Events> listOfEvents = [
    Events(time: "5pm", eventName: "New Icon", description: "Mobile App"),
    Events(
        time: "3 - 4pm", eventName: "Design Stand Up", description: "Hangouts"),
    Events(time: "12pm", eventName: "Lunch Break", description: "Main Room"),
    Events(
        time: "9 - 11am",
        eventName: "Finish Home Screen",
        description: "Web App"),
  ];

  final List<Color> listOfColors = [
    Constants.kPurpleColor,
    Constants.kGreenColor,
    Constants.kRedColor
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Random random = new Random();
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(title: Text(title!), actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade200,
                child: const Text('PH'),
              ),
              new Positioned(
                right: 0,
                top: 0,
                child: new Container(
                  padding: const EdgeInsets.all(1),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: listOfEvents.length,
                itemBuilder: (context, i) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Row(
                          children: [
                            SizedBox(width: size.width * 0.1),
                            SizedBox(
                              child: Text(listOfEvents[i].time),
                              width: size.width * 0.2,
                            ),
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(listOfEvents[i].eventName),
                                  Text(
                                    listOfEvents[i].description,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 50,
                        child: new Container(
                          height: size.height * 0.7,
                          width: 1.0,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: new BoxDecoration(
                              color: listOfColors[random.nextInt(3)],
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
