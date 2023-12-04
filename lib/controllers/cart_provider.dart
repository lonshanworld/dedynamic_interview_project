import 'package:dedynamicinterviewprojectbylonshan/models/products/product_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/cart_model.dart';

class CartProvider extends ChangeNotifier{
  List<CartModel> _cartList = [];
  List<CartModel> get cartList => _cartList;
  int get count{
    int value = 0;
    for (CartModel element in _cartList) {
      value = value + element.quantity;
    }
    return value;
  }

  int getSpecificCount(ProductModel productModel){
    int specificCount = 0;

    for (CartModel element in cartList) {
      if(element.productModel.productCode == productModel.productCode){
        specificCount = element.quantity;
        break;
      }
    }
    return specificCount;
  }

  void clearList(){
    _cartList.clear();
    notifyListeners();
  }

  void modifyCartList(List<CartModel> newCartList){
    // _cartList.clear();
    // for (var element in newCartList) {_cartList.add(element);}
    _cartList = newCartList;
    notifyListeners();
  }

  void addToCart(ProductModel productModel){
    List<CartModel> newCartList = List.from(cartList);
    bool found = false;
    if(newCartList.isEmpty){
      newCartList.add(CartModel(productModel: productModel, quantity: 1));
    }else{
      for (CartModel element in newCartList) {
        if(element.productModel.productCode == productModel.productCode){
          element.quantity ++;
          found = true;
          break;
        }
      }
      if(!found)newCartList.add(CartModel(productModel: productModel, quantity: 1));
    }
    modifyCartList(newCartList);
  }

  void removeFromCart(ProductModel productModel){
    List<CartModel> newCartList = List.from(cartList);
    for (var element in newCartList) {
      if(element.productModel.productCode == productModel.productCode && element.quantity > 1){
        element.quantity --;
        break;
      }
    }
    modifyCartList(newCartList);
  }
}