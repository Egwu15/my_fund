class CardModel {
  late int id;
  late int userId;
  late String card;
  late String valid;
  late int cvv;
  late String createdAt;
  late String updatedAt;

  CardModel(
      {required this.id,
      required this.userId,
      required this.card,
      required this.valid,
      required this.cvv,
      required this.createdAt,
      required this.updatedAt});

  CardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    card = json['card'];
    valid = json['valid'];
    cvv = json['cvv'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['card'] = this.card;
    data['valid'] = this.valid;
    data['cvv'] = this.cvv;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
