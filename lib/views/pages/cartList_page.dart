import 'package:dedynamicinterviewprojectbylonshan/controllers/cart_provider.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/cart_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/appbar_widget.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/boxes/product_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListPage extends StatelessWidget {
  static const String routeName = "/cartPage";

  const CartListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CartModel> cartList = context.watch<CartProvider>().cartList;

    return Scaffold(
      appBar: AppbarWidget(
        title: "Cart Page",
        func: null,
        isMain: false,
        showCart: true,
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        onPressed: () => context.read<CartProvider>().clearList(),
        child: Text("Clear List"),
      ),
      body: ListView(
        children: cartList
            .map((e) => ProductBoxWidget(
                productModel: e.productModel,
                showAddToCart: true,
                showAddRemove: true))
            .toList(),
      ),
    );
  }
}
