import 'value_object.dart';

class Password extends ValueObject<String> {
  const Password({required String value}) : super(value: value);

  @override
  bool get isValid {
    const pattern = r'^(?=.[A-Za-z])(?=.\d)[A-Za-z\d]{8,}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  @override
  String get message => "Password inválido.";
}
