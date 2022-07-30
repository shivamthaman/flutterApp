part of 'locker_cubit.dart';

enum Status {
  initial,
  loading,
  success,
  failure,
}

class LockerState extends Equatable {
  const LockerState({
    this.status = Status.initial,
    this.lockerModel,
    this.errorMessage,
  });
  final Status status;
  final LockerModel? lockerModel;
  final String? errorMessage;

  LockerState copyWith({
    LockerModel? lockerModel,
    Status? status,
    String? errorMessage,
  }) {
    return LockerState(
      lockerModel: lockerModel ?? this.lockerModel,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [lockerModel, status, errorMessage];
}
