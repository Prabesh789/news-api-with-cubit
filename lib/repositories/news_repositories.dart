import 'package:dio/dio.dart';
import 'package:newsapi/models/news_model.dart';
import 'package:newsapi/network_services/urls.dart';

class NewsRepositories {
  Dio _dio = Dio();

  Future<dynamic> getNews({String counrtyCode, String newsCategory}) async {
    try {
      final response = await _dio.get(
          "$baseUrl$topHeadlinesEndpoint$country$counrtyCode$apiKey$category$newsCategory");
      // return response; //for checking fetching data first
      NewsModel result = NewsModel.fromJson(response.data);
      // print(result);
      return (result);
    } catch (e) {
      return null;
    }
  }
}
