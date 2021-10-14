class ProductModel {
  int? id;
  int? shop_id;
  String? name;
  int? stock;

  ProductModel({
    this.id,
    this.shop_id,
    this.name,
    this.stock,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shop_id = json['shop_id'];
    name = json['name'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'shop_id': shop_id,
      'name': name,
      'stock': stock,
    };
  }
}
