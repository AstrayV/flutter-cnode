import 'package:flutter/material.dart';


import 'package:flutter_cnode/pages/home_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_cnode/redux/index.dart';
import 'package:flutter_redux/flutter_redux.dart';

//class MyApp extends StatefulWidget{
//  _MyAppState createState()=> _MyAppState();
//}




class MyApp extends StatelessWidget{
  final Store<AppState> store;

  MyApp({this.store});

  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      home: HomePage(),
//      theme: ThemeData(
//        primaryColor: const Color(0xff333333)
//      ),
//    );
//  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider(
      store: this.store,
      child: MaterialApp(
        home: StoreConnector<AppState,AppState>(
          builder: (BuildContext context,AppState state){
            return HomePage(store: store);
          },
          converter: (Store<AppState> store){
            return store.state;
          }
        ),
        theme: ThemeData(
          primaryColor:  const Color(0xff333333),
        ),
      ),
    );
  }
}

