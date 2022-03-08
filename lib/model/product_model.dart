class ProductModel {
  String? id;
  bool? isActive;
  String? price;
  String? company;
  String? picture;
  String? buyer;
  String? status;
  String? registered;
  List? tags;

  ProductModel({
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.picture,
    this.buyer,
    this.status,
    this.registered,
    this.tags,
  });

  ProductModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    isActive = json['isActive'];
    price = json['price'];
    company = json['company'];
    picture = json['picture'];
    buyer = json['buyer'];
    status = json['status'];
    registered = json['registered'];
    tags = json['tags'];
  }

}