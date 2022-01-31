import 'value_object.dart';

class Email extends ValueObject<String> {
  const Email({required String value}) : super(value: value);

  @override
  bool get isValid {
    const pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+";
    final regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  @override
  String get message => "E-mail inválido.";
}
