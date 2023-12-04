import 'package:flutter/material.dart';

class CusLoadingWidget extends StatelessWidget {
  const CusLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.deepOrangeAccent,
      ),
    );
  }
}
