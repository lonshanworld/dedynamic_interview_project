import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';

class NoItemWidget extends StatelessWidget {
  
  final String? txt;
  const NoItemWidget({
    super.key,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: txt == null 
          ? 
      Icon(
        Icons.question_mark,
        color: Colors.red,
        size: UIConstants.iconSize,
      )
          :
      Text(
        txt!,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red.withOpacity(0.5),
          fontSize: UIConstants.size13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
