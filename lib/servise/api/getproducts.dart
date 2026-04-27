import 'package:dio/dio.dart';

class GetProducts {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://dummyjson.com"));
  Future<List<dynamic>> fetchProducts() async {
    try {
      final res = await _dio.get("/products");

      return res.data["products"];
    } on Exception catch (e) {
      throw Exception("Error is Happened in get products");
    }
  }
}
