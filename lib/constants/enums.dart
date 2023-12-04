import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/item_category_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/product_division_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/product_group_model.dart';

enum CategoryLevel{
  productDivision("Product-Division", ProductDivisionModel),
  productGroup("Product-Group", ProductGroupModel),
  itemCategory("Item-Category", ItemCategoryModel);


  final String txt;
  final Type objectModel;
  const CategoryLevel(this.txt, this.objectModel);

  static Type _typeFromJson(String typeName) {
    // Implement logic to convert typeName to Type
    // You may need to adjust this based on your actual model types
    switch (typeName) {
      case 'ProductDivisionModel':
        return ProductDivisionModel;
      case 'ProductGroupModel':
        return ProductGroupModel;
      case 'ItemCategoryModel':
        return ItemCategoryModel;
      default:
        throw ArgumentError('Invalid type name');
    }
  }

  static String _typeToJson(Type type) {
    // Implement logic to convert Type to typeName
    // You may need to adjust this based on your actual model types
    if (type == ProductDivisionModel) {
      return 'ProductDivisionModel';
    } else if (type == ProductGroupModel) {
      return 'ProductGroupModel';
    } else if (type == ItemCategoryModel) {
      return 'ItemCategoryModel';
    } else {
      throw ArgumentError('Invalid type');
    }
  }

  factory CategoryLevel.fromJson(Map<String, dynamic> json) {
    String txt = json['txt'];
    Type objectModel = _typeFromJson(json['objectModel']);

    for (CategoryLevel level in CategoryLevel.values) {
      if (level.txt == txt && level.objectModel == objectModel) {
        return level;
      }
    }
    throw ArgumentError('Invalid CategoryLevel');
  }

  Map<String, dynamic> toJson() {
    return {
      'txt': txt,
      'objectModel': _typeToJson(objectModel),
    };
  }
}