// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model_res_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModelResDM _$NewsModelResDMFromJson(Map<String, dynamic> json) =>
    NewsModelResDM(
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsModelResDMToJson(NewsModelResDM instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data,
    };
