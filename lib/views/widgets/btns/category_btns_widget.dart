import 'package:dedynamicinterviewprojectbylonshan/constants/enums.dart';
import 'package:dedynamicinterviewprojectbylonshan/constants/ui_constants.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/item_category_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/product_division_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/product_group_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/pages/categorylist_page.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class CategoryBtnWidget extends StatelessWidget {

  final CategoryLevel categoryLevel;
  final Object objectData;
  final bool showTitle;
  const CategoryBtnWidget({
    super.key,
    required this.categoryLevel,
    required this.objectData,
    required this.showTitle,
  });

  @override
  Widget build(BuildContext context) {
    
    TextStyle titleStyle() =>const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: UIConstants.size20,
    );

    Widget txtWidget(String txt) =>Text(
      txt,
      style: titleStyle(),
    );

    Widget btnWidget(){
      switch(categoryLevel.objectModel){
        case ProductDivisionModel :
          final ProductDivisionModel data = objectData as ProductDivisionModel;
          return InkWell(
            onTap: (){
              print(data);
              Navigator.of(context).pushNamed(
                CategoryListScreen.routeName,
                arguments: {
                  "categoryLevel" : categoryLevel.toJson(),
                  "object" : data.toJson(),
                  "title" : "${data.divisionName}'s itemCategories"
                },
              );
            },
            child: Column(
              children: [
                if(showTitle)Center(
                  child: txtWidget("Product-Division"),
                ),
                Text(data.divisionName),
              ],
            ),
          );
        case ItemCategoryModel :
          final ItemCategoryModel data = objectData as ItemCategoryModel;
          return InkWell(
            onTap: (){
              print(data);
              Navigator.of(context).pushNamed(
                CategoryListScreen.routeName,
                arguments: {
                  "categoryLevel" : categoryLevel.toJson(),
                  "object" : data.toJson(),
                  "title" : "${data.itemCategoryName}'s product-Categories"
                },
              );
            },
            child: Column(
              children: [
                if(showTitle)Center(
                  child: txtWidget("Item-Category"),
                ),
                Row(
                  children: [

                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ImageWidget(imageUrl: data.imageUrl),
                    ),
                    Text(data.itemCategoryName),
                  ],
                ),
              ],
            ),
          );
        case ProductGroupModel :
          final ProductGroupModel data = objectData as ProductGroupModel;
          return Column(
            children: [
              if(showTitle)Center(
                child: txtWidget("Product-Category"),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ImageWidget(imageUrl: data.imageUrl),
                  ),
                  Text
                    (data.productCategoryName),
                ],
              ),
            ],
          );
        default :
          return const SizedBox.shrink();
      }
    }

    return btnWidget();
  }
}
