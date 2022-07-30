import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oro/payment/repositry/payment_repo.dart';

import '../model/payment_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentRepositry) : super(const PaymentState());
  final PaymentRepositry paymentRepositry;

  Future<void> getData() async {
    try {
      PaymentModel paymentModel = await paymentRepositry.getPaymentDetails();
      String intAmount = paymentModel.payment[0].amount.replaceAll(',', '');

      double selectedAmount = double.parse(intAmount);

      double taxAmount = (selectedAmount / 100) * 18;
      int amount = taxAmount.ceil() + int.parse(intAmount);
      emit(
        state.copyWith(
          status: Status.success,
          paymentModel: paymentModel,
          tax: taxAmount.ceil(),
          payableAmount: amount,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> seletedIndex(int index) async {
    String intAmount =
        state.paymentModel!.payment[index].amount.replaceAll(',', '');

    double selectedAmount = double.parse(intAmount);

    double taxAmount = (selectedAmount / 100) * 18;
    int amount = taxAmount.ceil() + int.parse(intAmount);

    emit(
      state.copyWith(
          status: Status.success,
          selectedIndex: index,
          tax: taxAmount.ceil(),
          payableAmount: amount),
    );
  }
}
