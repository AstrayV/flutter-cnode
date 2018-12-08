import 'package:flutter/material.dart';


import 'package:flutter_cnode/pages/home_page.dart';




class MyApp extends StatefulWidget{
  _MyAppState createState()=> _MyAppState();
}




class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: const Color(0xff333333)
      ),
    );
  }
}

