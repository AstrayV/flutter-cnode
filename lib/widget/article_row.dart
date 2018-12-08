

import 'package:flutter/material.dart';

import 'package:flutter_cnode/model/article_row_model.dart';

import 'package:flutter_cnode/config/article_type.dart';
import 'package:flutter_cnode/utils/utils.dart';

class ArticleRow extends StatelessWidget{
  final ArticleRowModel rowData;
  ArticleRow({Key key,this.rowData}) : super(key: key);



  
  Map config(){
    if(rowData.top == true){
      return {'bg': const Color(0xff80bd01),'text': '置顶','textColor': Colors.white};
    }else{
      if(rowData.tab != null){
        return {'bg': Colors.grey,'text': articleType[rowData.tab],'textColor': const Color(0xffffffff)};
      }else{
        return {'bg': Colors.grey,'text': '其他','textColor': const Color(0xffffffff)};
      }

    }
  }


  @override
  Widget build(BuildContext context) {





    return InkWell(
      onTap: (){

      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${rowData.title}',overflow: TextOverflow.ellipsis,textAlign: TextAlign.left,),
                SizedBox(
                  height: 6.0,
                ),
                Row(
//                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            config()['text'],
                            style: TextStyle(
                              color: config()['textColor'],
                            ),
                          ),
                          color: config()['bg'],
                          padding: EdgeInsets.fromLTRB(6.0, 4.0, 6.0, 4.0),
                          margin: EdgeInsets.only(right: 6.0),
                        ),
                        Text(
                          rowData.author.loginname,
                        ),
                      ],
                    ),

                    Text(
                      Util.getTimeDuration(rowData.lastReplyAt),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
        ],
      )
    );
  }
}


