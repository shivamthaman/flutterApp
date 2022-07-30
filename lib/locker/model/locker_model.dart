import 'dart:convert';

LockerModel lockerModelFromJson(String str) =>
    LockerModel.fromJson(json.decode(str));

String lockerModelToJson(LockerModel data) => json.encode(data.toJson());

class LockerModel {
  LockerModel({
    required this.lockerConent,
  });

  List<LockerConent> lockerConent;

  factory LockerModel.fromJson(Map<String, dynamic> json) => LockerModel(
        lockerConent: List<LockerConent>.from(
            json["locker_conent"].map((x) => LockerConent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "locker_conent":
            List<dynamic>.from(lockerConent.map((x) => x.toJson())),
      };
}

class LockerConent {
  LockerConent({
    required this.srNo,
    required this.quantity,
    required this.quality,
    required this.stoneWeight,
    required this.grossWeight,
    required this.netWeight,
    required this.item,
  });

  String srNo;
  String quantity;
  String quality;
  String stoneWeight;
  String grossWeight;
  String netWeight;
  String item;

  factory LockerConent.fromJson(Map<String, dynamic> json) => LockerConent(
        srNo: json["sr_no"],
        quantity: json["quantity"],
        quality: json["quality"],
        stoneWeight: json["stone_weight"],
        grossWeight: json["gross_weight"],
        netWeight: json["net_weight"],
        item: json["item"],
      );

  Map<String, dynamic> toJson() => {
        "sr_no": srNo,
        "quantity": quantity,
        "quality": quality,
        "stone_weight": stoneWeight,
        "gross_weight": grossWeight,
        "net_weight": netWeight,
        "item": item,
      };
}
