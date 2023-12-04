import 'package:dedynamicinterviewprojectbylonshan/models/products/product_variant_model.dart';

class ProductModel{
  final String productCode;
  final String erpCode;
  final String productName;
  final num price;
  final String? imageUrl;
  final List<ProductVariantModel> variants;

  ProductModel({
    required this.productCode,
    required this.erpCode,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.variants,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) => ProductModel(
      productCode : jsonData["productCode"],
      erpCode : jsonData["erpCode"],
      productName : jsonData["productName"],
      price : jsonData["price"],
      imageUrl : jsonData["imageUrl"],
      variants : [],
    );


  Map<String, dynamic> toJson()=>{
    "productCode" : productCode,
    "erpCode" : erpCode,
    "productName" : productName,
    "price" : price,
    "imageUrl" : imageUrl,
    "variants" : variants.map((e) => e.toJson()).toList(),
  };
}