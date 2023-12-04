import 'package:dedynamicinterviewprojectbylonshan/models/products/product_detail_model.dart';
import 'package:flutter/material.dart';

import '../../../constants/enums.dart';
import '../btns/category_btns_widget.dart';

class ProductDetailBoxWidget extends StatelessWidget {

  final ProductDetailModel productDetailModel;
  const ProductDetailBoxWidget({
    super.key,
    required this.productDetailModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey,
          thickness: 0.5,
          height: 0,
        ),
        CategoryBtnWidget(
          categoryLevel: CategoryLevel.productDivision,
          objectData: productDetailModel.productDivisionModel,
          showTitle: true,
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.5,
          height: 0,
        ),
        CategoryBtnWidget(
          categoryLevel: CategoryLevel.itemCategory,
          objectData: productDetailModel.itemCategoryModel,
          showTitle: true,
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.5,
          height: 0,
        ),
        CategoryBtnWidget(
          categoryLevel: CategoryLevel.productGroup,
          objectData: productDetailModel.productGroupModel,
          showTitle: true,
        ),
        Divider(
          color: Colors.grey,
          thickness: 0.5,
          height: 0,
        )
      ],
    );
  }
}
