import 'package:flutter/material.dart';

import 'package:flutter_cnode/widget/my_draw.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter_cnode/utils/data_utils.dart';
import 'package:flutter_cnode/model/article_row_model.dart';

import 'package:flutter_cnode/widget/article_row.dart';

import 'package:flutter_cnode/widget/header_indicator.dart';

//redux
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_cnode/redux/index.dart';

import 'package:redux/redux.dart';



class HomePage extends StatefulWidget {
  Store<AppState> store;
  HomePage({this.store});
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  getInitData() async {
    var data;
    var tab = widget.store.state.tab.tab;
    if (tab == null) {
      data = await DataUtils.getList({'page': 1, 'limit': 15});
    } else {
      data = await DataUtils.getList({'page': 1, 'limit': 15, 'tab': tab});
    }
    widget.store.dispatch(ListChangeAction(list: data));
    setState(() {});
  }

  RefreshController _refreshController;

  List<ArticleRowModel> arr = [];

  @override
  void initState() {
    _refreshController = new RefreshController();
    super.initState();
    getInitData();
  }

  Widget _rowBuilder(context, i, list) {
    if (list != null) {
      print(i);
      return ArticleRow(rowData: list[i]);
    } else {
      return null;
    }
  }

  void refresh(bool) async {
    if (bool) {
      await getInitData();
      setState(() {
        _refreshController.sendBack(true, RefreshStatus.completed);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe1e1e1),
      appBar: AppBar(
        title: Text('最新'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              debugPrint('edit');
            },
            color: Colors.white,
          )
        ],
      ),

      body: StoreConnector(builder: (context, List<ArticleRowModel> list) {
        return SmartRefresher(
            enablePullDown: true,
            controller: _refreshController,
            onRefresh: refresh,
            headerBuilder: ((BuildContext context, int mode) {
              return HeaderIndicator(mode: mode);
            }),
            child: ListView.builder(
              itemBuilder: (context, i) => _rowBuilder(context, i, list),
              itemCount: list == null ? 0 : list.length,
              physics: const AlwaysScrollableScrollPhysics(),
            ));
//          return HomeList(list: list);
      }, converter: (Store<AppState> store) {
        return store.state.list.list;
      }),
      drawer: MyDrawer(),
    );
  }
}
