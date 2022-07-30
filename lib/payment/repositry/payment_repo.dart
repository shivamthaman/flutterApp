import 'package:oro/services/data.dart';

import '../model/payment_model.dart';

class PaymentRepositry<PaymentModel> {
  Future getPaymentDetails() async {
    try {
      var response = await getData('assets/data/payment.json');
      final paymentModel = paymentModelFromJson(response);
      return paymentModel;
    } catch (e) {
      throw UnknownException();
    }
  }
}

class UnknownException implements Exception {}
