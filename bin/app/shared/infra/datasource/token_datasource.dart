import '../../domain/value_objects/token.dart';

abstract class TokenDatasource {
  String generate({required String id});

  void veryfied({required Token token});
}
