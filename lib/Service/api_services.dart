import 'package:dio/dio.dart';
import 'package:newsapp/Model/news_model_res_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:3000/api")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("/news")
  Future<NewsModelResDM> getNews(
      @Query("page") int page, @Query("limit") int? limit);

  @GET("/top/news")
  Future<NewsModelResDM> getTopNews();
}
