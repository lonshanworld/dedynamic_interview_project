import "package:dedynamicinterviewprojectbylonshan/controllers/cart_provider.dart";
import "package:dedynamicinterviewprojectbylonshan/models/products/product_model.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../constants/ui_constants.dart";

class AddToCartBtn extends StatelessWidget {

  final ProductModel productModel;
  const AddToCartBtn({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        context.read<CartProvider>().addToCart(productModel);

      },
      child: const Column(
        children: [
          Text(
            "Add to Cart",
            style: TextStyle(
              color: Colors.blue,
              fontSize: UIConstants.size10,
            ),
          ),
          Icon(
            Icons.add,
            size: UIConstants.iconSize,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
