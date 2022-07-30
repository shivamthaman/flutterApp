import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oro/locker/model/locker_model.dart';
import 'package:oro/locker/repo/locker_repo.dart';

part 'locker_state.dart';

class LockerCubit extends Cubit<LockerState> {
  LockerCubit(this.lockerRepositry) : super(const LockerState());
  final LockerRepositry lockerRepositry;

  Future<void> getData() async {
    try {
      LockerModel lockerModel = await lockerRepositry.getLockerContent();

      emit(
        state.copyWith(
          status: Status.success,
          lockerModel: lockerModel,
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
}
