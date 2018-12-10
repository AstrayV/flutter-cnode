
import 'package:flutter_cnode/model/article_row_model.dart';


class AppState{
  PageState page;
  TabState tab;
  ListState list;
  TitleState title;
  AppState({this.page,this.tab,this.list,this.title});
}





class PageState {
  int page = 1;

  PageState({this.page:1});
  PageState.initState(){ page = 1;}
}


class TabState {
  String tab = '';
  TabState({this.tab: ''});
  TabState.initState(){ tab = '';}
}

class ListState{
  List<ArticleRowModel> list = [];
  ListState({this.list});
  ListState.initState(){list = [];}
}

class TitleState{
  String title = '最新';
  TitleState({this.title: '最新'});
  TitleState.initState(){
    title = '最新';
  }
}


enum Actions{
  pageChange,
  tabChange,
  listChange,
  titleChange,
}


class Action{
  final Actions type;
  Action({this.type});
}
class TitleChangeAction extends Action{
  final String title;

  TitleChangeAction({this.title}): super(type: Actions.titleChange);

}



class PageChangeAction extends Action{
  final int page;

  PageChangeAction({this.page}):super(type: Actions.pageChange);
}


class TabChangeAction extends Action{
  final String tab;

  TabChangeAction({this.tab}): super(type: Actions.tabChange);
}

class ListChangeAction extends Action{
  List<ArticleRowModel> list;

  ListChangeAction({this.list}): super(type: Actions.listChange);
}



AppState mainReducer (AppState state,dynamic action){
  if(action is PageChangeAction){
    state.page.page = action.page;
  }

  if(action is TabChangeAction){
    state.tab.tab  = action.tab;
  }

  if(action is ListChangeAction){
    state.list.list = action.list;
  }

  if(action is TitleChangeAction){
    state.title.title = action.title;
  }
  return state;
}

