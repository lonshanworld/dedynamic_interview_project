
import 'package:dedynamicinterviewprojectbylonshan/controllers/products_provider.dart';
import 'package:dedynamicinterviewprojectbylonshan/models/products/product_model.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/appbar_widget.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/boxes/product_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  static const String routeName = "/homePage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<ProductModel> productList = context.watch<ProductsProvider>().productList;

    return Scaffold(
      appBar: const AppbarWidget(
        title: "Home page",
        func: null,
        isMain: true,
        showCart: true,
      ),
      body: ListView(
        children: productList.map((e) {
          return Column(
            children: [
              ProductBoxWidget(productModel: e, showAddToCart: true, showAddRemove: false,),
              Divider(
                color: Colors.grey,
                thickness: 0.5,
                height: 0,
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}
