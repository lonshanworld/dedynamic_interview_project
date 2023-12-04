class ProductVariantModel{
  final String variantCode;
  final String? imageUrl;

  ProductVariantModel({
    required this.variantCode,
    required this.imageUrl,
  });

  factory ProductVariantModel.fromJson(Map<String, dynamic> jsonData) => ProductVariantModel(
      variantCode : jsonData["variantCode"],
      imageUrl : jsonData["imageUrl"],
  );


  Map<String, dynamic> toJson() =>{
    "variantCode" : variantCode,
    "imageUrl" : imageUrl,
  };
}