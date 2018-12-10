import 'package:flutter/material.dart';
import 'package:flutter_cnode/pages/my_app.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

import 'redux/index.dart';

//void main() => runApp(new MyApp());
void main() {
  Store<AppState> store = new Store<AppState>(mainReducer,
      initialState: new AppState(
          page: new PageState(), tab: new TabState(), list: new ListState()));
  runApp(MyApp(store: store));
}
