import 'value_object.dart';

class Email extends ValueObject<String> {
  const Email({required String value}) : super(value: value);

  @override
  bool get isValid {
    const pattern =
        r'^[-a-zA-Z0-9][-.a-zA-Z0-9]@[-.a-zA-Z0-9]+(.[-.a-zA-Z0-9]+).(com|edu|info|gov|int|mil|net|org|biz|name|museum|coop|aero|pro|tv|[a-zA-Z]{2})$';
    final regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  @override
  String get message => "E-mail inválido.";
}
