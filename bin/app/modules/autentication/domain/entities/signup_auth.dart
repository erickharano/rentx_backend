import '../../../../shared/domain/entities/entitiy.dart';
import '../../../../shared/domain/value_objects/email.dart';
import '../../../../shared/domain/value_objects/password.dart';

class SignupAuth extends Entity {
  final String name;
  final Email email;
  final Password pass;

  const SignupAuth({
    required this.name,
    required this.email,
    required this.pass,
  });

  @override
  List<Object?> get props => [name, email, pass];
}
