import 'package:dio/dio.dart';

class GetproductDetails {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://dummyjson.com"));

  Future<Map<String, dynamic>> fetchAProduct(int id) async {
    try {
      final productIdDetails = await _dio.get("/products/$id");

      return productIdDetails.data;
    } on Exception catch (e) {
      throw Exception("error is happened in get ap product ${e.toString()}");
    }
  }
}
