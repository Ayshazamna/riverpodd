// lib/state/controller.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/product.dart';
import '../data/models/shape_list.dart';
import '../data/services/api_service.dart';

final apiServiceProvider = Provider<EyeApiService>((ref) {
  return EyeApiService();
});

final productsProvider = FutureProvider<List<Productt>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return await apiService.getHomeProducts();
});

final categoriesProvider = FutureProvider<List<ShapeList>>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  return await apiService.getCategories();
});
