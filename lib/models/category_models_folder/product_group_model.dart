class ProductGroupModel {
  final int productCategoryId;
  final String productCategoryName;
  final int itemCategoryId;
  final String? imageUrl;

  ProductGroupModel({
    required this.productCategoryId,
    required this.productCategoryName,
    required this.itemCategoryId,
    required this.imageUrl
  });

  factory ProductGroupModel.fromJson(Map<String, dynamic> jsonData) => ProductGroupModel(
    productCategoryId: jsonData["productCategoryId"],
    productCategoryName: jsonData["productCategoryName"],
    itemCategoryId: jsonData["itemCategoryId"],
    imageUrl: jsonData["imageUrl"],
  );

  Map<String, dynamic> toJson()=>{
    "productCategoryId" : productCategoryId,
    "productCategoryName" : productCategoryName,
    "itemCategoryId" : itemCategoryId,
    "imageUrl" : imageUrl,
  };
}