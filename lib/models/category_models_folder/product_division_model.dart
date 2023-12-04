class ProductDivisionModel{
  final int divisionId;
  final String divisionName;

  ProductDivisionModel({
    required this.divisionId,
    required this.divisionName,
  });

  factory ProductDivisionModel.fromJson(Map<String, dynamic> jsonData) =>
    ProductDivisionModel(
      divisionId: jsonData["divisionId"],
      divisionName: jsonData["divisionName"],
    );


  Map<String, dynamic> toJson()=>{
    "divisionId" : divisionId,
    "divisionName" : divisionName,
  };
}