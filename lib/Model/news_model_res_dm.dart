import 'package:json_annotation/json_annotation.dart';
import 'package:newsapp/Model/news_model.dart';
part 'news_model_res_dm.g.dart';

@JsonSerializable()
class NewsModelResDM {
  int count;
  List<NewsModel> data;
  NewsModelResDM({required this.count, required this.data});

  factory NewsModelResDM.fromJson(Map<String, dynamic> json) =>
      _$NewsModelResDMFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelResDMToJson(this);
}
