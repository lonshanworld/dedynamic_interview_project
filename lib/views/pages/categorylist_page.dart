import "package:dedynamicinterviewprojectbylonshan/apis/api_services/category_service.dart";
import "package:dedynamicinterviewprojectbylonshan/constants/enums.dart";
import "package:dedynamicinterviewprojectbylonshan/models/category_models_folder/item_category_model.dart";
import "package:dedynamicinterviewprojectbylonshan/models/category_models_folder/product_division_model.dart";
import "package:dedynamicinterviewprojectbylonshan/models/category_models_folder/product_group_model.dart";
import "package:dedynamicinterviewprojectbylonshan/views/widgets/appbar_widget.dart";
import "package:dedynamicinterviewprojectbylonshan/views/widgets/btns/category_btns_widget.dart";
import "package:dedynamicinterviewprojectbylonshan/views/widgets/cus_loading_widget.dart";
import "package:dedynamicinterviewprojectbylonshan/views/widgets/no_item_widget.dart";
import "package:flutter/material.dart";

class CategoryListScreen extends StatelessWidget {
  static const String routeName = "/categoryListScreen";

  final CategoryLevel categoryLevel;
  final Object object;
  final String title;
  const CategoryListScreen({
    super.key,
    required this.categoryLevel,
    required this.object,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final CategoryService categoryService = CategoryService();

    Future<List<dynamic>?> getDataList() async {
      switch (categoryLevel.objectModel) {
        case ProductDivisionModel:
          final ProductDivisionModel productDivisionModeol =
              object as ProductDivisionModel;
          return await categoryService
              .getItemCategoryModelList(productDivisionModeol.divisionId);

        // case ProductGroupModel :
        //   final ProductGroupModel productGroupModel = object as ProductGroupModel;
        //   return await categoryService.getProductGroupList(productGroupModel.productCategoryId);

        case ItemCategoryModel:
          final ItemCategoryModel itemCategoryModel =
              object as ItemCategoryModel;
          return await categoryService
              .getProductGroupList(itemCategoryModel.itemCategoryId);
        default:
          return null;
      }
    }

    return Scaffold(
      appBar: AppbarWidget(
        title: title,
        func: null,
        isMain: false,
        showCart: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getDataList(),
          builder: (ctx, snapShot) {
            if (snapShot.connectionState != ConnectionState.done) {
              return const CusLoadingWidget();
            } else {
              if (snapShot.data!.isNotEmpty && snapShot.data != null) {
                return Column(
                  children: snapShot.data!
                      .map((e) => CategoryBtnWidget(
                            categoryLevel:
                                categoryLevel.objectModel == ItemCategoryModel
                                    ? CategoryLevel.productGroup
                                    : CategoryLevel.itemCategory,
                            objectData: e,
                            showTitle: false,
                          ))
                      .toList(),
                );
              } else {
                return NoItemWidget(txt: "No product division");
              }
            }
          },
        ),
      ),
    );
  }
}
