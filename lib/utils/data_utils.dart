import 'package:flutter_cnode/model/article_row_model.dart';
import 'dart:async' show Future;
import 'package:flutter_cnode/utils/request_utils.dart';



class DataUtils {
  static Future<List<ArticleRowModel>> getList(
      Map<String, dynamic> params) async {
    var res = await RequestUtils.get('https://cnodejs.org/api/v1/topics',
        params: params);
    print(params.toString());
    var resList = res['data'];
    List<ArticleRowModel> resultList = new List();
    for (int i = 0; i < resList.length; i++) {
      if (params['page'] == 7) {
        print(resList[i]);
      }
      ArticleRowModel rowData = new ArticleRowModel.fromJson(resList[i]);
      resultList.add(rowData);
    }
    return resultList;
  }
}