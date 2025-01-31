import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_mart/feature/product/model/product_model.dart';
import 'package:tech_mart/feature/product/view_model/product_generics.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tech_mart/feature/shop/model/sell_model.dart';
import 'package:tech_mart/feature/shop/view_model/sell_generics.dart';
import '../../../core/service/auth_service.dart';

final sellProvider = StateNotifierProvider<SellController, SellGenerics> ((ref) => SellController());

class SellController extends StateNotifier<SellGenerics> {
  SellController() : super(SellGenerics());

  final SupabaseClient supabase = Supabase.instance.client;
  final authService = AuthService();

  Future<void> sellInitialize() async {
    state = state.update(isLoading: true);
    try {
      final data = await supabase.from('sell').select();

      // Convert each record (Map<String, dynamic>) to ProductModel
      List<SellModel> newSells = data.map<SellModel>((e) {
        return SellModel.fromMap(e); // Converting the map into the productModel
      }).toList();

      state = state.update(isLoading: false, sells: newSells);

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

  Future<bool> insertSell({required int productId, required String email, required String name, required String phone, required String brand, required String category,
    required String address, required String productName, required String description, required int price, required int discount}) async {

    state = state.update(isLoading: true);
    try {
      final response = await supabase.from('sell').insert(
        {
          'name': name,
          'email': email,
          'product_id': productId,
          'phone': phone,
          'address': address,
          'product_name': productName,
          'description': description,
          'price': price,
          'discount': discount,
          'brand': brand,
          'category': category,
        }
      );
      if (kDebugMode) {
        print(response);
      }
      state = state.update(isLoading: false);
      return true;
    } catch (e) {
      state = state.update(isLoading: false);
      if (kDebugMode) {
        print("Insert Sell = $e");
      }
      return false;
    }
  }

  Future<bool> deleteSell({required int id, required int productId}) async {
    state = state.update(isLoading: true);
    try {
      final data2 = await supabase.from('sell').delete().eq('id', id);
      if (kDebugMode) {
        print(data2);
      }
      state = state.update(isLoading: false);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("Delete Product using by SellProvider = $e");
      }
      state = state.update(isLoading: false);
      return false;
    }
  }
}