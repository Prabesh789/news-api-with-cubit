import 'package:json_annotation/json_annotation.dart';
import 'package:newsapi/models/article_model.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  String status;
  int totalResults;
  List<ArticlesModel> articles;

  NewsModel({this.status, this.totalResults, this.articles});
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  // NewsModel.fromJson(Map<String, dynamic> json) {
  //   status = json['status'];
  //   totalResults = json['totalResults'];
  //   if (json['articles'] != null) {
  //     articles = new List<Articles>();
  //     json['articles'].forEach((v) {
  //       articles.add(new Articles.fromJson(v));
  //     });
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['totalResults'] = this.totalResults;
  //   if (this.articles != null) {
  //     data['articles'] = this.articles.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
