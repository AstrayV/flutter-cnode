import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDrawer extends StatefulWidget {
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,

        children: <Widget>[
          DrawerHeader(
            child: SvgPicture.network(
            'http://static2.cnodejs.org/public/images/cnodejs_light.svg'),
            decoration: BoxDecoration(
              color: const Color(0xff333333),
            ),
          ),
          ListTile(
            title: Text('登录'),
            leading: Icon(Icons.camera_alt)
          ),
          Divider(),
          ListTile(
            title: Text('板块'),
          ),
          Divider(),
          ListTile(
            title: Text('最新',textAlign: TextAlign.center),

          ),
          Divider(),
          ListTile(
            title: Text('分享',textAlign: TextAlign.center),
          ),
          Divider(),
          ListTile(
            title: Text('问答',textAlign: TextAlign.center),
          ),
          Divider(),
          ListTile(
            title: Text('招聘',textAlign: TextAlign.center),
          ),
          Divider(),

        ],
      ),
    );

//      padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 8.0),
//        child: Column(
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                Container(
//                  child: SvgPicture.network(
//                      'http://static2.cnodejs.org/public/images/cnodejs_light.svg'),
//                  color: const Color(0xff333333),
//                  height: 100.0,
//                  width: 300.0,
//                  padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 8.0),
//                )
//              ],
//            ),
//          ],
//        ));
  }
}
