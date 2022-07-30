part of 'ekyc_cubit.dart';

class EkycState extends Equatable {
  const EkycState({
    this.fileName = "english",
  });
  final String fileName;

  EkycState copyWith({
    String? fileName,
  }) {
    return EkycState(
      fileName: fileName ?? this.fileName,
    );
  }

  @override
  List<Object> get props => [fileName];
}
