import 'package:equatable/equatable.dart';

abstract class ValueObject<T> extends Equatable {
  final T value;

  const ValueObject({
    required this.value,
  });

  String get message;

  bool get isValid;

  @override
  List<Object?> get props => [value];
}
