

import 'dart:async';

import 'package:flutter/material.dart';

import 'constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = false;
  int minute=0;
  int hour=1;
  String amPm="Am";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: Colors.black,
        title: Text(
          "Wheel Scroll",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                      child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ))),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // hour portion starts here
                  SizedBox(
                    height: 200,
                    width: 70,
                    child: ListWheelScrollView.useDelegate(
                      useMagnifier: true,
                      magnification: 1.5,
                      onSelectedItemChanged: (value) {
                        hour = value+1;
                      },
                      itemExtent: 40,
                      physics: const FixedExtentScrollPhysics(),
                      perspective: 0.008,
                      childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 12,
                          builder: (BuildContext context, int index) {
                            return CurrentTime(
                              time: index+1,
                            );
                          }),
                    ),

                    //hour portion ends here

                  ),
                  SizedBox(width: 5),

                  //minute portion starts here
                  SizedBox(
                    width: 70,
                    height: 200,
                    child: ListWheelScrollView.useDelegate(
                      useMagnifier: true,
                      magnification: 1.5,
                      onSelectedItemChanged: (value) {
                        minute = value;
                      },
                      itemExtent: 40,
                      physics: FixedExtentScrollPhysics(),
                      perspective: 0.008,
                      childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 60,
                          builder: (BuildContext context, int index) {
                            return CurrentTime(
                              time: index,
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 70,
                    height: 100,
                    child: ListWheelScrollView.useDelegate(
                      useMagnifier: true,
                      magnification: 1.5,
                      onSelectedItemChanged: (value) {
                        if (value == 0) {
                          amPm = "Am";
                        } else
                          amPm = "PM";
                      },
                      itemExtent: 40,
                      physics: FixedExtentScrollPhysics(),
                      perspective: 0.008,
                      childDelegate: ListWheelChildBuilderDelegate(
                          childCount: 2,
                          builder: (BuildContext context, int index) {
                            if (index == 0) {
                              return AmPm(isAm: true);
                            } else
                              return AmPm(isAm: false);
                          }),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
              alignment: Alignment.center,
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      isVisible = true;
                      print("set state");
                      Timer(Duration(seconds: 2),(){
                        isVisible = false;
                        print(isVisible);
                        setState(() {});
                      });
                    });

                    setState(() {});
                  },
                  child: Text(
                    "Add Time",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ))),
          SizedBox(height: 30),
          Visibility(
              visible: isVisible,
              child: Text(
                "Your Selected Time is $hour:$minute $amPm",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
