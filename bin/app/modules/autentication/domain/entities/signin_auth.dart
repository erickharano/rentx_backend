import '../../../../shared/domain/entities/entitiy.dart';
import '../../../../shared/domain/value_objects/email.dart';
import '../../../../shared/domain/value_objects/password.dart';

class SigninAuth extends Entity {
  final Email email;
  final Password pass;

  const SigninAuth({
    required this.email,
    required this.pass,
  });

  @override
  List<Object?> get props => [email, pass];
}
