class ProductModel{
  int? id;
  String? title;
  String? description;
  String? thumbnail;

  ProductModel({required this.id, required this.title, required this.description, required this.thumbnail});
  ProductModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    thumbnail = json['thumbnail'];
  }
}