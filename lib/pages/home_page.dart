import 'package:flutter/material.dart';

import 'package:flutter_cnode/widget/my_draw.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';



import 'package:flutter_cnode/utils/data_utils.dart';
import 'package:flutter_cnode/model/article_row_model.dart';

import 'package:flutter_cnode/widget/article_row.dart';

import 'package:flutter_cnode/widget/header_indicator.dart';



class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int page = 1;
  int limit = 15;




  List<ArticleRowModel> articleList = [];

  RefreshController _refreshController;



  void getData() async{
    var data = await DataUtils.getList({'page':page,'limit': limit});
    if(this.mounted){
      setState(() {
        articleList = data;

      });
    }
  }




  void refresh(bool) async{


    if(bool){
      print('up');
      page = 1;

      var data = await DataUtils.getList({'page': page, 'limit':limit});

      setState(() {
        _refreshController.sendBack(true, RefreshStatus.completed);
        articleList = data;
      });
    }else{



      page = page + 1;
      var newData = await DataUtils.getList({'page': page, 'limit': limit,'mdrender': false});
      if(newData.length > 0){
        setState(() {
          if(newData.length == limit){
            _refreshController.sendBack(false, RefreshStatus.canRefresh);
          }else{
            _refreshController.sendBack(false, RefreshStatus.noMore);
          }
          newData.forEach((item){
            articleList.add(item);
          });
        });
      }else{
        setState(() {
          _refreshController.sendBack(false, RefreshStatus.noMore);
        });
      }
    }

  }


  @override
  void initState() {
    _refreshController = new RefreshController();
    super.initState();
    getData();
  }

  Widget _rowBuilder(context,i){
    return ArticleRow(rowData: articleList[i]);
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
            onPressed: (){
              debugPrint('edit');
            },
            color: Colors.white,
          )
        ],
      ),

//      body: RefreshIndicator(
//        backgroundColor: Colors.white,
//        child: ListView.builder(
//          itemBuilder: _rowBuilder,
//          itemCount: articleList.length,
//          physics: const AlwaysScrollableScrollPhysics(),
//        ),
//        onRefresh: refresh,
//      ),
//      body: SmartRefresher(
//        enablePullDown: true,
//        onRefresh: (bool)=>refresh(bool),
//        controller: _refreshController,
//
//        child: ListView.builder(
//          itemBuilder: _rowBuilder,
//          itemCount: articleList.length,
//          physics: const AlwaysScrollableScrollPhysics(),
//        )
//      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: refresh,
        controller: _refreshController,
        headerBuilder: ((BuildContext context, int mode){return new HeaderIndicator(mode:mode);}),
        child: ListView.builder(itemBuilder: _rowBuilder,itemCount: articleList.length,physics: const AlwaysScrollableScrollPhysics()),
      ),
      drawer: MyDrawer(),

    );
  }
}
