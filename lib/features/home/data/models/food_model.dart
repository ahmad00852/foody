class FoodModel {
  String id;
  String name;
  String description;
  double price;
  String ingredients;
  String image;
  double rate;
  String category;

  FoodModel({
    required this.category,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.ingredients,
    required this.image,
    required this.rate,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
        category: json['category'],
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        ingredients: json['ingredients'],
        image: json['image'],
        rate: json['rate']);
  }
}
