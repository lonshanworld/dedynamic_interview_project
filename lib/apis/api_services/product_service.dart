import 'package:dedynamicinterviewprojectbylonshan/apis/api_request.dart';

import '../../models/products/product_detail_model.dart';
import '../../models/products/product_model.dart';

class ProductService{
  final ApiRequest apiRequest = ApiRequest();

  Future<List<ProductModel>> getProductList() async{
    List<ProductModel> productList = [];

    dynamic data = await apiRequest.getApiRequest("products");
    // print(data["data"]);
    if(data == null) return productList;
    for (Map<String, dynamic> element in data["data"]) {
      ProductModel productModel = ProductModel.fromJson(element);
      productList.add(productModel);
    }

    return productList;
  }

  Future<ProductDetailModel?> getProductDetail(String productCode)async{
    dynamic data = await apiRequest.getApiRequest("products/$productCode");
    print(data);
    if(data == null) return null;
    return ProductDetailModel.fromJson(data);
  }

  Future<List<ProductModel>> getRelatedProductList(String productCode)async{
    List<ProductModel> productList = [];
    dynamic data = await apiRequest.getApiRequest("products/related-product/$productCode");
    // print(data);
    for(Map<String, dynamic>element in data["data"]){
      ProductModel productModel = ProductModel.fromJson(element);
      productList.add(productModel);
    }

    return productList;
  }

}