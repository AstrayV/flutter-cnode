import 'package:json_annotation/json_annotation.dart';

part 'article_row_model.g.dart';


@JsonSerializable()
class ArticleRowModel extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'author_id')
  String authorId;

  @JsonKey(name: 'tab')
  String tab;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'last_reply_at')
  String lastReplyAt;

  @JsonKey(name: 'good')
  bool good;

  @JsonKey(name: 'top')
  bool top;

  @JsonKey(name: 'reply_count')
  int replyCount;

  @JsonKey(name: 'visit_count')
  int visitCount;

  @JsonKey(name: 'create_at')
  String createAt;

  @JsonKey(name: 'author')
  Author author;

  ArticleRowModel(this.id,this.authorId,this.tab,this.content,this.title,this.lastReplyAt,this.good,this.top,this.replyCount,this.visitCount,this.createAt,this.author,);

  factory ArticleRowModel.fromJson(Map<String, dynamic> srcJson) => _$ArticleRowModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticleRowModelToJson(this);

}


@JsonSerializable()
class Author extends Object {

  @JsonKey(name: 'loginname')
  String loginname;

  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  Author(this.loginname,this.avatarUrl,);

  factory Author.fromJson(Map<String, dynamic> srcJson) => _$AuthorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);

}


