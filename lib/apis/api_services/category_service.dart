

import 'package:dedynamicinterviewprojectbylonshan/apis/api_request.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/item_category_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/product_group_model.dart';

import '../../models/category_models_folder/product_division_model.dart';

class CategoryService{
  final ApiRequest apiRequest = ApiRequest();

  //first level
  Future<List<ProductDivisionModel>> getProductDivisionList()async{
    List<ProductDivisionModel> productDivisionList = [];
    dynamic data = await apiRequest.getApiRequest("product-divisions");
    print(data);
    for(Map<String, dynamic> element in data){
      ProductDivisionModel productDivisionModel = ProductDivisionModel.fromJson(element);
      productDivisionList.add(productDivisionModel);
    }
    return productDivisionList;
  }

  // secondary
  Future<List<ItemCategoryModel>> getItemCategoryModelList(int divisionId)async{
    List<ItemCategoryModel> itemCategoryModelList = [];
    dynamic data = await apiRequest.getApiRequest("product-divisions/item-categories?divisionId=$divisionId");
    print(data);
    for(Map<String, dynamic> element in data){
      ItemCategoryModel itemCategoryModel = ItemCategoryModel.fromJson(element);
      itemCategoryModelList.add(itemCategoryModel);
    }
    return itemCategoryModelList;
  }

  // third level
  Future<List<ProductGroupModel>> getProductGroupList(int itemCategoryId)async{
    List<ProductGroupModel> productGroupList = [];

    dynamic data = await apiRequest.getApiRequest("product-divisions/product-groups?itemCategoryId=$itemCategoryId");
    print(data);
    for(Map<String, dynamic> element in data){
      ProductGroupModel productGroupModel = ProductGroupModel.fromJson(element);
      productGroupList.add(productGroupModel);
    }
    return productGroupList;
  }


}