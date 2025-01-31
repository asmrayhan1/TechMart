import 'package:tech_mart/feature/shop/model/sell_model.dart';

class SellGenerics{
  bool isLoading;
  List<SellModel>? sells;
  SellGenerics({this.isLoading = false, this.sells = const []});

  SellGenerics update({bool? isLoading, List<SellModel>? sells}){
    return SellGenerics(
        isLoading: isLoading ?? this.isLoading,
        sells: sells ?? this.sells
    );
  }
}