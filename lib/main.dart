import 'package:age_calculator/helper/provider.dart';
import 'package:age_calculator/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main()=>runApp(MaterialApp(
  home: ChangeNotifierProvider(create: (BuildContext context) => ProviderHelper(),
  child: MyApp()),
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Homepage();
  }
}