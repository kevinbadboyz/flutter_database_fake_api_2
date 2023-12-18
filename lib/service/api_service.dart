import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../response/product_response.dart';

class ApiService{
  
  Future<ProductResponse?> getProducts() async{
    try{
      final response = await Dio().get('https://dummyjson.com/products');
      debugPrint('GET Product : ${response.data['products']}');
      return ProductResponse.fromJson(response.data['products']);
    }on DioException catch(e){
      debugPrint(e.toString());
    }
  }
}