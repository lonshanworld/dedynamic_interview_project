import 'package:dedynamicinterviewprojectbylonshan/models/products/product_model.dart';

class CartModel{
  final ProductModel productModel;
  int quantity = 0;

  CartModel({
    required this.productModel,
    required this.quantity,
  });
}