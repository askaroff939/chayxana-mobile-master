import 'dart:convert';
import 'package:dio/dio.dart';

import 'inter_service.dart';

/// This service will change later
class NetworkService {
  static bool isTester = true;
  static Dio dio = Dio(_baseDioOptions)..interceptors.add(DioInterceptor());

  static String SERVER_DEVELOPMENT = "http://10.10.6.66:4543";
  static String SERVER_PRODUCTION = "http://10.10.6.66:4543";

  /* Dio Apis */
  static String API_LIST = "/photos";
  static String API_DELETE = "/photos/"; //{id}
  //http://62.109.0.156:8085/api/v1/open/mobile/checkOneMonthIsBron?roomId=debaf37a-0452-4ef3-9ae0-0508dee324e4&num=11
  static String myParams = "?chayxanaId=14f24bc4-6072-4d67-9932-91e7945f5b54&size=12";
  static String myApi = "/api/v1/open/mobile/getByUserSize";
  static String API_TO_FREE_ROOM = "/api/v1/open/mobile/checkOneMonthIsBron";

  static Map<String, String> get headers {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept-Version': 'v1',
      // 'Accept': 'application/json',
      // 'Authorization': 'Client-ID zYGJr9DhtNKBrx-M5SL9b4QJe3j9kxXlYQtZVB10st8',
      // 'App-OS': Platform.operatingSystem,
      // 'App-Language': LangService.locale.languageCode,
    };
    return headers;
  }

  static String get baseApiUrl {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  static final BaseOptions _baseDioOptions = BaseOptions(
    baseUrl: baseApiUrl,
    headers: headers,
    connectTimeout: 40000,
    receiveTimeout: 40000,
    contentType: 'application/json',
    responseType: ResponseType.json,
  );

  /* Dio Requests */
  static Future<String?> GET(String api, String params) async {
    print(NetworkService.baseApiUrl + api + params);
    Response response = await dio.get(NetworkService.baseApiUrl + api + params);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    Response response = await dio.post(api + myParams, data: params);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> MULTIPART(String api, String path) async {
    Response response = await dio.post(api, data: {
      "file":await MultipartFile.fromFile(path, filename: "test")
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    Response response = await dio.put(api, data: params);// http or https
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> PATCH(String api, Map<String, dynamic> params) async {
    Response response = await dio.patch(api + myParams, data: params);// http or https
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, dynamic> params) async {
    Response response = await dio.delete(api, data: params);// http or https
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonEncode(response.data);
    }
    return null;
  }


  /* Dio Params */
  // static Map<String, dynamic> paramsEmpty() {
  //   Map<String, String> params = {};
  //   return params;
  // }
  //
  // static Map<String, dynamic> paramsPage(int pageNumber) {
  //   Map<String, String> params = {};
  //   params.addAll({"page": pageNumber.toString()});
  //   return params;
  // }
  //
  // static Map<String, dynamic> paramsSearch(String search, int pageNumber) {
  //   Map<String, String> params = {};
  //   params.addAll({"page": pageNumber.toString(), "query": search});
  //   return params;
  // }

  /* Dio body */
  // static Map<String, dynamic> bodyCreate(Object object) {
  //   Map<String, dynamic> body = {};
  //   body.addAll(object.toJson());
  //   return body;
  // }
  //
  // static Map<String, dynamic> paramsUpdate(Object object) {
  //   Map<String, dynamic> body = {};
  //   body.addAll(object.toJson());
  //   return body;
  // }

  /* Dio parsing */
  // static List<Object> parseResponse(String response) {
  //   List json = jsonDecode(response);
  //   List<Object> objects = List<Object>.from(json.map((x) => Object.fromJson(x)));
  //   return objects;
  // }

  /// Exception bilan handle qilinadi
}