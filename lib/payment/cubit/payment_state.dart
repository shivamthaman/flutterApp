part of 'payment_cubit.dart';

enum Status {
  initial,
  loading,
  success,
  failure,
}

class PaymentState extends Equatable {
  const PaymentState({
    this.status = Status.initial,
    this.paymentModel,
    this.errorMessage,
    this.selectedIndex = 0,
    this.payableAmount,
    this.tax,
  });
  final Status status;
  final PaymentModel? paymentModel;
  final String? errorMessage;
  final int selectedIndex;
  final int? payableAmount;
  final int? tax;
  PaymentState copyWith({
    PaymentModel? paymentModel,
    Status? status,
    String? errorMessage,
    int? selectedIndex,
    int? payableAmount,
    int? tax,
  }) {
    return PaymentState(
      paymentModel: paymentModel ?? this.paymentModel,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      payableAmount: payableAmount ?? this.payableAmount,
      tax: tax ?? this.tax,
    );
  }

  @override
  List<Object?> get props =>
      [paymentModel, status, errorMessage, selectedIndex, payableAmount, tax];
}
