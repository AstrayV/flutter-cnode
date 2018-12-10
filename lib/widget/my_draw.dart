import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//redux
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_cnode/redux/index.dart';
import 'package:flutter_cnode/config/article_type.dart';
import 'package:flutter_cnode/redux/index.dart';
import 'package:flutter_cnode/utils/data_utils.dart';
class MyDrawer extends StatefulWidget {
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<MyDrawer> {

  tap(store,String type) async{
    print(type);
    String title;
    if(type == null){
      title = '最新';
    }else{
      title = articleType[type];
    }
    store.dispatch(TitleChangeAction(title: title));
    store.dispatch(TabChangeAction(tab: type));
    store.dispatch(PageChangeAction(page: 1));
    var data;
    if(type == null){
       data = await DataUtils.getList({'page': 1,'limit': 15,});
    }else{
      data = await DataUtils.getList({'page': 1,'limit': 15,'tab': type});
    }
    store.dispatch(ListChangeAction(list: data));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: StoreConnector(builder: (context, store) {
        return ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            child: SvgPicture.network(
                'http://static2.cnodejs.org/public/images/cnodejs_light.svg'),
            decoration: BoxDecoration(
              color: const Color(0xff333333),
            ),
          ),
          ListTile(
            title: Text('登录'),
            leading: Icon(Icons.camera_alt),

          ),
          Divider(),
          ListTile(
            title: Text('板块'),

          ),
          Divider(),
          ListTile(
            title: Text('最新', textAlign: TextAlign.center),
            onTap: (){
              Navigator.pop(context);
              tap(store, null);
            },

          ),
          Divider(),
          ListTile(
            title: Text('分享', textAlign: TextAlign.center),
            onTap: (){
              Navigator.pop(context);
              tap(store, 'share');
            },
          ),
          Divider(),
          ListTile(
            title: Text('问答', textAlign: TextAlign.center),
            onTap: (){
              Navigator.pop(context);
              tap(store, 'ask');
            },
          ),
          Divider(),
          ListTile(
            title: Text('招聘', textAlign: TextAlign.center),
            onTap: (){
              Navigator.pop(context);
              tap(store, 'job');
            },
          ),
          Divider(),
        ]);
      }, converter: (Store<AppState> store) {
        return store;
      }),
    );
//    return Drawer(
//      child: ListView(
//        padding: EdgeInsets.zero,
//
//        children: <Widget>[
//          DrawerHeader(
//            child: SvgPicture.network(
//            'http://static2.cnodejs.org/public/images/cnodejs_light.svg'),
//            decoration: BoxDecoration(
//              color: const Color(0xff333333),
//            ),
//          ),
//          ListTile(
//            title: Text('登录'),
//            leading: Icon(Icons.camera_alt)
//          ),
//          Divider(),
//          ListTile(
//            title: Text('板块'),
//          ),
//          Divider(),
//          ListTile(
//            title: Text('最新',textAlign: TextAlign.center),
//
//          ),
//          Divider(),
//          ListTile(
//            title: Text('分享',textAlign: TextAlign.center),
//          ),
//          Divider(),
//          ListTile(
//            title: Text('问答',textAlign: TextAlign.center),
//          ),
//          Divider(),
//          ListTile(
//            title: Text('招聘',textAlign: TextAlign.center),
//          ),
//          Divider(),
//
//        ],
//      ),
//    );
  }
}
