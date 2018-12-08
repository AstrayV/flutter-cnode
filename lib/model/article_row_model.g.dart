// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_row_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleRowModel _$ArticleRowModelFromJson(Map<String, dynamic> json) {
  return ArticleRowModel(
      json['id'] as String,
      json['author_id'] as String,
      json['tab'] as String,
      json['content'] as String,
      json['title'] as String,
      json['last_reply_at'] as String,
      json['good'] as bool,
      json['top'] as bool,
      json['reply_count'] as int,
      json['visit_count'] as int,
      json['create_at'] as String,
      json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ArticleRowModelToJson(ArticleRowModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author_id': instance.authorId,
      'tab': instance.tab,
      'content': instance.content,
      'title': instance.title,
      'last_reply_at': instance.lastReplyAt,
      'good': instance.good,
      'top': instance.top,
      'reply_count': instance.replyCount,
      'visit_count': instance.visitCount,
      'create_at': instance.createAt,
      'author': instance.author
    };

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(json['loginname'] as String, json['avatar_url'] as String);
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'loginname': instance.loginname,
      'avatar_url': instance.avatarUrl
    };
