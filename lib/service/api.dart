import 'package:dio/dio.dart';

class Network {
  final Dio dio;

  Network({required this.dio});
  String url = "https://todolistassessment.hasura.app/v1/graphql";
  String apiKey =
      "JG7vDm15n1fVT2QhwYNyDFJJmm5iQKIea3H0tVpYnNV735Wa2ms3msthBGquM2sm";
  String developerId = "id-vikki";

  Future<Response?> get() async {
    try {
      final response = await dio.get(url,
          queryParameters: {
            "developer_id": developerId,
          },
          options: Options(headers: {
            "x-hasura-admin-secret": apiKey,
            "content-type": "application/json",
          }));

      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  Future<Response?> post({required Map<String, dynamic> data}) async {
    try {
      final response = await dio.post(
        url,
          queryParameters: {
            "developer_id": developerId,
          }, 
          data: data,
          options: Options(headers: {
            "x-hasura-admin-secret": apiKey,
            "content-type": "application/json",
          }));

      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
