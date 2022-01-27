import '../value_objects/token.dart';
import 'entitiy.dart';

class Authorization extends Entity {
  final Token token;

  const Authorization({required this.token});

  @override
  List<Object?> get props => [token];
}
