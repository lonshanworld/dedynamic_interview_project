import 'package:dedynamicinterviewprojectbylonshan/constants/enums.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/item_category_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/product_division_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/category_models_folder/product_group_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/products/product_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/pages/cartList_page.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/pages/categorylist_page.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/pages/home_page.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/pages/product_detail_page.dart';
import 'package:flutter/material.dart';

class AppRouter{
  Route onGenerateRoute(RouteSettings routeSettings){
    dynamic routeArgs = routeSettings.arguments;

    switch(routeSettings.name){
      case HomePage.routeName :
        return MaterialPageRoute(
          builder: (ctx){
            return const HomePage();
          }
        );

      case ProductDetailScreen.routeName :
        return MaterialPageRoute(
          builder: (ctx){

            return ProductDetailScreen(productModel: ProductModel.fromJson(routeArgs));
          }
        );
      case CartListPage.routeName :
        return MaterialPageRoute(
            builder: (ctx){

              return const CartListPage();
            }
        );
      case CategoryListScreen.routeName :
        return MaterialPageRoute(
          builder: (ctx){
            final CategoryLevel categoryLevel = CategoryLevel.fromJson(routeArgs["categoryLevel"]);
            dynamic objData;
            switch(categoryLevel.objectModel){
              case ProductDivisionModel :
                objData = ProductDivisionModel.fromJson(routeArgs["object"]);
              case ProductGroupModel :
                objData = ProductGroupModel.fromJson(routeArgs["object"]);
              case ItemCategoryModel :
                objData = ItemCategoryModel.fromJson(routeArgs["object"]);
            }
            return CategoryListScreen(categoryLevel: categoryLevel, object: objData, title: routeArgs["title"],);
          }
        );
      default :
        return MaterialPageRoute(
          builder: (ctx){
            return const HomePage();
          }
        );
    }
  }
}