import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter/material.dart';

class SnakeBar extends StatefulWidget {
  ValueSetter onChangingIndex;
  late int currenIndex;
  SnakeBar({Key? key, required this.onChangingIndex, required this.currenIndex})
      : super(key: key);

  @override
  State<SnakeBar> createState() => _SnakeBarState();
}

class _SnakeBarState extends State<SnakeBar> {
  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      currentIndex: widget.currenIndex,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      behaviour: SnakeBarBehaviour.floating,
      elevation: 0,
      backgroundColor: Color(0xff111526),
      padding: const EdgeInsets.all(12),
      //snakeShape:  SnakeShape.circle,
      selectedItemColor: const Color(0xffF6F5FA),
      unselectedItemColor: const Color(0xffF6F5FA),

      snakeViewColor:const Color(0xff918BE0),
      onTap: (index) {
        widget.currenIndex = index;
        widget.onChangingIndex(index);
      },

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home)),
        BottomNavigationBarItem(icon: Icon(Icons.settings)),
        BottomNavigationBarItem(icon: Icon(Icons.person)),
      ],
    );
  }
}
