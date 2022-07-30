// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'ekyc_state.dart';

class EkycCubit extends Cubit<EkycState> {
  EkycCubit() : super(const EkycState());

  changeLanguage(String value) {
    emit(state.copyWith(fileName: value));
  }
}
