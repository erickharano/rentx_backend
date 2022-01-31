import 'value_object.dart';

class Token extends ValueObject<String> {
  const Token({required String value}) : super(value: value);

  @override
  bool get isValid {
    const pattern = r'^Bearer\s[a-zA-Z0-9-]+?.[a-zA-Z0-9-]+?.([a-zA-Z0-9-_]+)?$';
    final regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  @override
  String get message => "Token inválido.";

  String get toFormat => value.split(" ")[1];
}
