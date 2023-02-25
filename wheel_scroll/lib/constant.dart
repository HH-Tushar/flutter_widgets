import 'package:flutter/material.dart';

TextStyle myWheelTextStyle=TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w400);

class CurrentTime extends StatelessWidget {
  final int time;
  const CurrentTime({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Center(child: Text(time.toString(),style: myWheelTextStyle,textAlign: TextAlign.center, ));
    return Center(child: Text(time<10?"0$time":"$time",style: myWheelTextStyle,textAlign: TextAlign.center, ));
  }
}


class Minutes extends StatelessWidget {
  final int minutes;
  const Minutes({Key? key, required this.minutes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(minutes<10?"0$minutes":"$minutes",style: myWheelTextStyle,textAlign: TextAlign.center,));
  }
}

class AmPm extends StatelessWidget {
  final bool isAm;
  const AmPm({Key? key, required this.isAm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(isAm==true?("AM"):("PM"),style: myWheelTextStyle,textAlign: TextAlign.center,));
  }
}
