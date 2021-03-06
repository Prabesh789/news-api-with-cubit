import 'package:json_annotation/json_annotation.dart';
import 'package:newsapi/models/source.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticlesModel {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ArticlesModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) =>
      _$ArticlesModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesModelToJson(this);

  // Articles.fromJson(Map<String, dynamic> json) {
  //   source =
  //       json['source'] != null ? new Source.fromJson(json['source']) : null;
  //   author = json['author'];
  //   title = json['title'];
  //   description = json['description'];
  //   url = json['url'];
  //   urlToImage = json['urlToImage'];
  //   publishedAt = json['publishedAt'];
  //   content = json['content'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.source != null) {
  //     data['source'] = this.source.toJson();
  //   }
  //   data['author'] = this.author;
  //   data['title'] = this.title;
  //   data['description'] = this.description;
  //   data['url'] = this.url;
  //   data['urlToImage'] = this.urlToImage;
  //   data['publishedAt'] = this.publishedAt;
  //   data['content'] = this.content;
  //   return data;
  // }
}
