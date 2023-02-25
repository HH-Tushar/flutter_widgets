import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:snake_navbar/snake_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<String> _screenName =  ["Home", "Setting", "Profile"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F5FA),
      appBar: AppBar(
        backgroundColor: const Color(0xff918BE0),
        title: const Text("Snake Navigation Bar"),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Center(
          child: Text(
            _screenName[_currentIndex],
            style: const TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      bottomNavigationBar: SnakeBar(
        currenIndex: _currentIndex,
        onChangingIndex: (value) {
          setState(() {
            _currentIndex = value;
          });

          print(_currentIndex);
        },
      ),
    );
  }
}
