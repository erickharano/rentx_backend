import '../../../../shared/domain/entities/entitiy.dart';
import '../../../../shared/domain/value_objects/id.dart';

class User extends Entity {
  final Id id;
  final String name;
  final String email;
  final String pass;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.pass,
  });

  @override
  List<Object?> get props => [id, name, email, pass];
}
