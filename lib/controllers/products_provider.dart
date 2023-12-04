import 'package:dedynamicinterviewprojectbylonshan/apis/api_services/product_service.dart';
import 'package:flutter/material.dart';

import '../models/products/product_model.dart';

class ProductsProvider extends ChangeNotifier{
  final ProductService productService = ProductService();

  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  ProductsProvider(){
    getProductList();
  }

  Future<void> getProductList()async{
    _productList = await productService.getProductList();
    notifyListeners();
  }
}