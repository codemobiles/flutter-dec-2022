import 'dart:convert';
import 'dart:io';

import 'package:demo1/src/constants/network_api.dart';
import 'package:demo1/src/models/product.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http_parser/http_parser.dart';

// Singleton or Factory Design Pattern
class NetworkService {
  NetworkService._internal();
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;

  static final Dio _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.baseUrl = NetworkAPI.baseURL;
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          await Future.delayed(Duration(seconds: 1));
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          switch (e.response?.statusCode) {
            case 301:
              break;
            case 401:
              break;
            default:
          }
          return handler.next(e);
        },
      ),
    );

  Future<List<Product>> getProduct() async {
    final response = await _dio.get(NetworkAPI.product);
    if (response.statusCode == 200) {
      return productFromJson(jsonEncode(response.data));
    }
    throw Exception();
  }

  Future<String> deleteProduct(int id) async {
    final response = await _dio.delete('${NetworkAPI.product}/$id');
    if (response.statusCode == 204) {
      return 'Delete Successfully';
    }
    throw Exception();
  }

  Future<String> editProduct(Product product, {File? imageFile}) async {
    FormData data = FormData.fromMap({
      'name': product.name,
      'price': product.price,
      'stock': product.stock,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response =
        await _dio.put('${NetworkAPI.product}/${product.id}', data: data);
    if (response.statusCode == 200) {
      return 'Edit Successfully';
    }
    throw Exception();
  }

  Future<String> addProduct(Product product, {File? imageFile}) async {
    FormData data = FormData.fromMap({
      'name': product.name,
      'price': product.price,
      'stock': product.stock,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        ),
    });

    final response = await _dio.post(NetworkAPI.product, data: data);
    if (response.statusCode == 201) {
      return 'Add Successfully';
    }
    throw Exception();
  }

  Future<String> submitLocation(LatLng position) async {
    var params = {
      "lat": position.latitude,
      "lng": position.longitude,
    };

    Response response = await Dio().post(
      "http://192.168.1.224:1150/submit_location",
      options:
          Options(headers: {HttpHeaders.contentTypeHeader: "application/json"}),
      data: jsonEncode(params),
    );

    if (response.statusCode == 201) {
      return 'Submit Successfully';
    }else{
      return 'Submit Failed';
    }

  }
}
