import 'dart:convert';

import 'package:demo1/src/models/product.dart';
import 'package:dio/dio.dart';

class ApiService {
  ApiService._internal();
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  Future<List<Product>> feed() async {
    final _dio = Dio();
    final result = await _dio.get("http://192.168.0.178:1150/products");
    final products = productFromJson(jsonEncode(result.data));
    return products;
  }
}