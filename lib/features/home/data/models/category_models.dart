class CategoryModels{
  String name;

  CategoryModels({
    required this.name,
  });
  factory CategoryModels.fromJson(Map<String,dynamic> json){
    return CategoryModels(name: json['name']);
  }
}