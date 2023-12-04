import 'package:dedynamicinterviewprojectbylonshan/views/widgets/cus_loading_widget.dart';
import 'package:flutter/material.dart';

import 'no_item_widget.dart';

class ImageWidget extends StatelessWidget {

  final String? imageUrl;
  const ImageWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl == null || imageUrl == ""
        ?
    const NoItemWidget(txt: "No image",)
        :
    Image.network(
      imageUrl!,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){

        return loadingProgress != null
            ?
        const CusLoadingWidget()
            :
        child;
      },
      errorBuilder: (BuildContext, Object, StackTrace){
        return const NoItemWidget(txt: "No image");
      },
    );
  }
}
