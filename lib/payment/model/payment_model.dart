import 'dart:convert';

PaymentModel paymentModelFromJson(String str) =>
    PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
  PaymentModel({
    required this.payment,
  });

  List<Payment> payment;

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        payment:
            List<Payment>.from(json["payment"].map((x) => Payment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "payment": List<dynamic>.from(payment.map((x) => x.toJson())),
      };
}

class Payment {
  Payment({
    required this.amount,
    required this.period,
    required this.monthly,
  });

  String amount;
  String period;
  String monthly;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        amount: json["amount"],
        period: json["period"],
        monthly: json["monthly"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "period": period,
        "monthly": monthly,
      };
}
