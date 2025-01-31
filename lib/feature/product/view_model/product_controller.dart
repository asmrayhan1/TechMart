import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_mart/feature/product/model/product_model.dart';
import 'package:tech_mart/feature/product/view_model/product_generics.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/service/auth_service.dart';

final productProvider = StateNotifierProvider<ProductController, ProductGenerics> ((ref) => ProductController());

class ProductController extends StateNotifier<ProductGenerics> {
  ProductController() : super(ProductGenerics());

  final SupabaseClient supabase = Supabase.instance.client;
  final authService = AuthService();

  Future<void> productInitialize() async {
    state = state.update(isLoading: true);
    try {
      final data = await supabase.from('product').select();

      // Convert each record (Map<String, dynamic>) to ProductModel
      List<ProductModel> newProducts = data.map<ProductModel>((e) {
        return ProductModel.fromMap(e); // Converting the map into the productModel
      }).toList();

      state = state.update(isLoading: false, products: newProducts);

      if (kDebugMode) {
        print(data);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      state = state.update(isLoading: false);
    }
  }

  Future<bool> insertProduct({required String category, required String brand, required String itemName, required File? imgFile,
    required String description, required int price, required int totalCount, required int discount}) async {
    String imgUrl = "";

    state = state.update(isLoading: true);
    if (imgFile != null) {
      final String fileName = '${DateTime.now().millisecondsSinceEpoch}.png';

      try {
        imgUrl = await supabase.storage.from('images').upload(fileName, imgFile);
      } catch (e) {
        state = state.update(isLoading: false);
        if (kDebugMode) {
          print("Insert Product Image = $e");
        }
        return false;
      }
    }
    try {
      final response = await supabase.from('product').insert(
          {
            'category': category,
            'image': imgUrl,
            'brand': brand,
            'item_name': itemName,
            'description': description,
            'price': price,
            'total_count': totalCount,
            'discount': discount,
          }
      );

      // await productInitialize();

      if (kDebugMode) {
        print(response);
      }
      state = state.update(isLoading: false);
      return true;
    } catch (e) {
      state = state.update(isLoading: false);
      if (kDebugMode) {
        print("Insert Product = $e");
      }
      return false;
    }
  }

  Future<bool> updateProduct({required int id, required String category, required String brand, required String itemName, required File? imgFile,
    required String img, required String description, required int price, required int totalCount, required int discount}) async {
    String imgUrl = img;

    state = state.update(isLoading: true);
    if (imgFile != null) {
      final String fileName = '${DateTime.now().millisecondsSinceEpoch}.png';

      try {
        imgUrl = await supabase.storage.from('images').upload(fileName, imgFile);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        state = state.update(isLoading: false);
        return false;
      }
    }
    try {
      ProductModel products = ProductModel(id: id, category: category, image: imgUrl, brand: brand, itemName: itemName, description: description, price: price, totalCount: totalCount, discount: discount);

      final response = await supabase.from('product').update(products.toMap()).eq('id', id);

      await productInitialize();

      if (kDebugMode) {
        print(response);
      }
      state = state.update(isLoading: false);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      state = state.update(isLoading: false);
      return false;
    }
  }

  Future<bool> deleteProduct({required int id}) async {
    state = state.update(isLoading: true);
    try {
      final data = await supabase.from('product').delete().eq('id', id);
      if (kDebugMode) {
        print(data);
      }
      state = state.update(isLoading: false);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      state = state.update(isLoading: false);
      return false;
    }
  }
}