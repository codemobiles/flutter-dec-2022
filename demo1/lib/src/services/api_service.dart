import 'dart:convert';

import 'package:demo1/src/models/product.dart';
import 'package:dio/dio.dart';

class ApiService {
  Future<List<Product>> feed() async {
    final _dio = Dio();
    final result = await _dio.get("http://192.168.0.178:1150/products");
    final products = productFromJson(jsonEncode(result.data));
    return products;
  }
}