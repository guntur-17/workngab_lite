class VisistingAllModel {
  int? id;
  String? shop_name;
  String? shop_address;
  String? status;

  VisistingAllModel({
    this.id,
    this.shop_name,
    this.shop_address,
    this.status,
  });

  VisistingAllModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shop_name = json['shop_name'];
    shop_address = json['shop_address'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'shop_name': shop_name,
      'shop_address': shop_address,
      'status': status
    };
  }
}
