import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/item_category_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/product_division_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/product_group_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/products/product_model.dart';

class ProductDetailModel{
  final List<dynamic> productMedia;
  final ProductModel productModel;
  final ProductDivisionModel productDivisionModel;
  final ItemCategoryModel itemCategoryModel;
  final ProductGroupModel productGroupModel;

  ProductDetailModel({
    required this.productMedia,
    required this.productModel,
    required this.productDivisionModel,
    required this.itemCategoryModel,
    required this.productGroupModel
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> jsonData) => ProductDetailModel(
      productMedia: jsonData["productMedia"],
      productModel: ProductModel.fromJson(jsonData),
      productDivisionModel: ProductDivisionModel.fromJson(jsonData),
      itemCategoryModel: ItemCategoryModel.fromJson(jsonData),
      productGroupModel: ProductGroupModel.fromJson(jsonData),
    );
  
}