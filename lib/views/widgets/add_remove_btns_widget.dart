import 'package:dedynamicinterviewprojectbylonshan/constants/ui_constants.dart';
import 'package:dedynamicinterviewprojectbylonshan/controllers/cart_provider.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/products/product_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/btns/cusIconBtn_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRemoveBtnsWidget extends StatelessWidget {

  final ProductModel productModel;

  const AddRemoveBtnsWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CusIconBtnWidget(
          icon: Icons.add_circle,
          func: () {
            context.read<CartProvider>().addToCart(productModel);
          },
          clr: Colors.green,
        ),
        Consumer<CartProvider>(
          builder: (context, provider, child) {
            return Text(
              context.read<CartProvider>().getSpecificCount(productModel).toString(),
              style: TextStyle(
                fontSize: UIConstants.size13,
              )
            );
          },
        ),
        CusIconBtnWidget(
          icon: Icons.remove_circle,
          func: () {
            context.read<CartProvider>().removeFromCart(productModel);
          },
          clr: Colors.red,
        ),

      ],
    );
  }
}
