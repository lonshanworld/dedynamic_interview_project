class ItemCategoryModel{
  final int itemCategoryId;
  final String itemCategoryName;
  final int divisionId;
  final String? imageUrl;

  ItemCategoryModel({
    required this.itemCategoryId,
    required this.itemCategoryName,
    required this.divisionId,
    required this.imageUrl,
  });

  factory ItemCategoryModel.fromJson(Map<String, dynamic> jsonData) =>
    ItemCategoryModel(
      itemCategoryId: jsonData["itemCategoryId"],
      itemCategoryName: jsonData["itemCategoryName"],
      divisionId: jsonData["divisionId"],
      imageUrl: jsonData["imageUrl"],
    );

  Map<String, dynamic> toJson() =>{
    "itemCategoryId" : itemCategoryId,
    "itemCategoryName" : itemCategoryName,
    "divisionId" : divisionId,
    "imageUrl" : imageUrl
  };
}