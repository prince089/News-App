import 'package:dio/dio.dart';
import 'package:newsapp/Model/news_model_res_dm.dart';
import 'package:newsapp/Service/api_services.dart';

class ApiRepository {
  final Dio dio = Dio();

  late final _apiService = ApiService(dio);

  Future<NewsModelResDM> getNews({required page, int? limit}) async {
    return await _apiService.getNews(page, limit);
  }
}
