import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../entity/cat_fact.dart';



part 'api_client.g.dart';

@RestApi(baseUrl: "https://catfact.ninja")
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;
  @GET("/fact?max_length=130")
  Future<CatFact> getTasks();
}

