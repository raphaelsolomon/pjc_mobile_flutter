class EstateModel {
  String image;
  String type;
  String price;
  String desc;
  String location;

  EstateModel({this.image, this.type, this.price, this.desc, this.location});

  factory EstateModel.fromJson(Map<String, dynamic> json) => EstateModel(
      image: json["image"],
      type: json["type"],
      price: json["price"],
      desc: json["desc"],
      location: json["location"]);
}
