import '../model/product_model.dart';

class ProductGenerics{
  bool isLoading;
  List<ProductModel>? products;
  ProductGenerics({this.isLoading = false, this.products = const []});

  ProductGenerics update({bool? isLoading, List<ProductModel>? products}){
    return ProductGenerics(
      isLoading: isLoading ?? this.isLoading,
        products: products ?? this.products
    );
  }
}