import 'package:dedynamicinterviewprojectbylonshan/constants/ui_constants.dart';
import 'package:dedynamicinterviewprojectbylonshan/controllers/cart_provider.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/pages/cartList_page.dart';
import 'package:dedynamicinterviewprojectbylonshan/views/widgets/btns/cusIconBtn_widget.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final VoidCallback? func;
  final bool isMain;
  final bool showCart;

  const AppbarWidget({
    super.key,
    required this.title,
    required this.func,
    required this.isMain,
    required this.showCart,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {


    return AppBar(
      title: Text(title),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: isMain
          ?
      null
          :
      CusIconBtnWidget(
        icon: Icons.arrow_back_ios_new_rounded,
        func: () {
          if (func != null) {
            func!();
          }
          Navigator.of(context).pop();
        },
        clr: Colors.black,
      ),
      actions: [
        if(showCart)SizedBox(
          width: 60,
          height: 60,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: CusIconBtnWidget(
                  icon: Icons.shopping_cart_outlined,
                  func: () {
                    Navigator.of(context).pushNamed(CartListPage.routeName);
                  },
                  clr: Colors.black,
                ),
              ),
              Positioned(
                top: 0,
                left: 5,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Consumer<CartProvider>(
                      builder: (context, provider, child) {
                        final int count = context
                            .watch<CartProvider>()
                            .count;
                        return Text(
                          count.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: UIConstants.size10,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
