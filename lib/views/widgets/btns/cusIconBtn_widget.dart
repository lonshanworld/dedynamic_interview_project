import 'package:dedynamicinterviewprojectbylonshan/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class CusIconBtnWidget extends StatelessWidget {

  final IconData icon;
  final VoidCallback func;
  final Color clr;
  const CusIconBtnWidget({
    super.key,
    required this.icon,
    required this.func,
    required this.clr,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,

      onPressed: func,
      icon: Icon(
        icon,
        size: UIConstants.iconSize,
        color: clr,
      ),
    );
  }
}
