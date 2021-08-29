import 'package:age_calculator/screens/design/header.dart';
import 'package:age_calculator/screens/design/middledesign.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Header(),
            Midle(),
          ],
        ),
      ),
    ));
  }
}