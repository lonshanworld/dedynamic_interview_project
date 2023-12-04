import "package:dedynamicinterviewprojectbylonshan/constants/ui_constants.dart";
import "package:dedynamicinterviewprojectbylonshan/models/products/product_model.dart";
import "package:dedynamicinterviewprojectbylonshan/views/pages/product_detail_page.dart";
import "package:dedynamicinterviewprojectbylonshan/views/widgets/add_remove_btns_widget.dart";
import "package:dedynamicinterviewprojectbylonshan/views/widgets/add_to_cart_btn.dart";
import "package:dedynamicinterviewprojectbylonshan/views/widgets/image_widget.dart";
import "package:flutter/material.dart";

class ProductBoxWidget extends StatelessWidget {

  final ProductModel productModel;
  final bool showAddToCart;
  final bool showAddRemove;
  const ProductBoxWidget({
    super.key,
    required this.productModel,
    required this.showAddToCart,
    required this.showAddRemove,
  });

  @override
  Widget build(BuildContext context) {
    
    Widget trailingWidget(){
      return showAddToCart ? showAddRemove ? AddRemoveBtnsWidget(productModel: productModel) : AddToCartBtn(productModel: productModel,) :const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: productModel.toJson());
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ImageWidget(imageUrl: productModel.imageUrl),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ERP Code : ${productModel.productCode}",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: UIConstants.size13,
                    ),
                  ),
                  Text(
                    productModel.productName,
                    style: const TextStyle(
                      fontSize: UIConstants.size16,
                    ),
                  ),
                  Text(
                    "Price: ${productModel.price} MMK",
                    style: const TextStyle(
                      fontSize: UIConstants.size13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 1,child: trailingWidget()),
          ],
        ),
      ),
    );
  }
}
