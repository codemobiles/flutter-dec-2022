import 'package:dio/dio.dart';

class ApiService {
  feed() async {
    final _dio = Dio();
    final result = await _dio.get("http://192.168.0.178:1150/products");
    print(result.data);
  }
}