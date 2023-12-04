import 'package:dedynamicinterviewprojectbylonshan/apis/api_services/product_service.dart';
import 'package:dedynamicinterviewprojectbylonshan/constants/ui_constants.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/products/product_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/add_to_cart_btn.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/appbar_widget.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/boxes/product_box_widget.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/boxes/product_detail_box_widget.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/cus_loading_widget.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "/productDetail";

  final ProductModel productModel;
  const ProductDetailScreen({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    final ProductService productService = ProductService();

    return Scaffold(
      appBar: const AppbarWidget(
        title: "Product Detail",
        func: null,
        isMain: false,
        showCart: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              productModel.productName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: UIConstants.size20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
              child: ImageWidget(imageUrl: productModel.imageUrl),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: AddToCartBtn(productModel: productModel),
            ),
            FutureBuilder(
              future: productService.getProductDetail(productModel.productCode),
              builder: (ctx, snapShot) {
                if (snapShot.connectionState == ConnectionState.done) {
                  if (snapShot.data == null) return const SizedBox.shrink();
                  return ProductDetailBoxWidget(
                      productDetailModel: snapShot.data!);
                } else {
                  return const CusLoadingWidget();
                }
              },
            ),
            FutureBuilder(
              future: productService
                  .getRelatedProductList(productModel.productCode),
              builder: (ctx, snapShot) {
                return Column(
                  children: [
                    const Text(
                      "Related Products",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: UIConstants.size20,
                        color: Colors.grey,
                      ),
                    ),
                    if (snapShot.connectionState != ConnectionState.done)
                      const CusLoadingWidget(),
                    if (snapShot.connectionState == ConnectionState.done &&
                        snapShot.data != null)
                      for (ProductModel element in snapShot.data!)
                        ProductBoxWidget(
                          productModel: element,
                          showAddToCart: false,
                          showAddRemove: false,
                        ),
                    if (snapShot.connectionState == ConnectionState.done &&
                        snapShot.data == null)
                      const Text(
                        "No related products",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: UIConstants.size13,
                          color: Colors.red,
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
