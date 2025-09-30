
// import 'package:dio/dio.dart';
// import '../model/product.dart';
// import '../model/shapelist.dart';
//
// class EyeApiService {
//   final Dio _dio;
//
//   EyeApiService()
//       : _dio = Dio(BaseOptions(
//     baseUrl: 'https://api.hanzprellet.com/api/customer/',
//     headers: {
//       'authorization': 'Bearer hanzprelet@142536',
//       'content-type': 'application/json',
//     },
//     connectTimeout: const Duration(seconds: 30),
//     receiveTimeout: const Duration(seconds: 30),
//   ));
//   Future<List<Productt>> getHomeProducts() async {
//     print(' CALLING getHomeProducts API...');
//     try {
//       final response = await _dio.get('/home/products');
//       print('API Status: ${response.statusCode}, Data length: ${response.data.length}');
//
//       if (response.statusCode == 200) {
//         List productJson = response.data;
//         final products = productJson.map((json) => Productt.fromJson(json)).toList();
//         print(' Created ${products.length} products');
//         return products; // DON'T FORGET THIS!
//       } else {
//         throw Exception("Failed to load products: ${response.statusCode}");
//       }
//     } on DioException catch (e) {
//       print(' Error: ${e.message}');
//       throw Exception('Dio Error: ${e.message}');
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
//
//
//
//   Future<List<ShapeList>> getCategories() async {
//     try {
//       final response = await _dio.get('/shapeList');
//
//       if (response.statusCode == 200) {
//         List categoryJson = response.data;
//         return categoryJson.map((json) => ShapeList.fromJson(json)).toList();
//       } else {
//         throw Exception("Failed to load categories: ${response.statusCode}");
//       }
//     } on DioException catch (e) {
//       throw Exception('Dio Error: ${e.message}');
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }


import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/product.dart';
import '../models/shape_list.dart';

class EyeApiService {
  final Dio _dio;

  EyeApiService()
      : _dio = Dio(BaseOptions(
    baseUrl: 'https://api.hanzprellet.com/api/customer/',
    headers: {
      'authorization': 'Bearer hanzprelet@142536',
      'content-type': 'application/json',
    },
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  ));

  Future<List<Productt>> getHomeProducts() async {
    print('🔄 CALLING getHomeProducts API...');
    try {
      final response = await _dio.get('home/products');
      print('✅ API Status: ${response.statusCode}');
      print('📦 Raw Response Type: ${response.data.runtimeType}');

      if (response.statusCode == 200) {
        List productJson = response.data;
        print('📊 Total products in response: ${productJson.length}');

        // Debug first product
        if (productJson.isNotEmpty) {
          print('🔍 First product raw data:');
          print(JsonEncoder.withIndent('  ').convert(productJson[0]));
        }

        final products = productJson.map((json) {
          final product = Productt.fromJson(json);
          print('---');
          print('Product: ${product.name}');
          print('  - Main image: ${product.image}');
          print('  - Images array: ${product.images?.length ?? 0} items');
          print('  - Color options: ${product.colorOptions?.length ?? 0} items');
          if (product.images != null && product.images!.isNotEmpty) {
            print('  - First image path: ${product.images!.first.image}');
          }
          return product;
        }).toList();

        print('✅ Successfully created ${products.length} products');
        return products;
      } else {
        throw Exception("Failed to load products: ${response.statusCode}");
      }
    } on DioException catch (e) {
      print('❌ DioException: ${e.type} - ${e.message}');
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout - Please check your internet');
      } else if (e.type == DioExceptionType.unknown) {
        throw Exception('CORS Error: Try running on mobile/desktop or use Chrome with --disable-web-security');
      }
      throw Exception('Network Error: ${e.message}');
    } catch (e, stackTrace) {
      print('❌ Error: $e');
      print('📍 Stack trace: $stackTrace');
      throw Exception('Error: $e');
    }
  }

  Future<List<ShapeList>> getCategories() async {
    print('🔄 CALLING getCategories API...');
    try {
      final response = await _dio.get('shapeList');
      print('✅ API Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        List categoryJson = response.data;
        print('📊 Total categories: ${categoryJson.length}');
        return categoryJson.map((json) => ShapeList.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load categories: ${response.statusCode}");
      }
    } on DioException catch (e) {
      print('❌ DioException: ${e.type} - ${e.message}');
      if (e.type == DioExceptionType.unknown) {
        throw Exception('CORS Error: Try running on mobile/desktop');
      }
      throw Exception('Network Error: ${e.message}');
    } catch (e) {
      print('❌ Error: $e');
      throw Exception('Error: $e');
    }
  }
}
