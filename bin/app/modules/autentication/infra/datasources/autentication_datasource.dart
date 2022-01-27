import '../../../../shared/domain/value_objects/email.dart';
import '../../domain/entities/signin_auth.dart';
import '../../domain/entities/signup_auth.dart';
import '../../domain/entities/user.dart';

abstract class AutenticationDatasource {
  Future<String> signin({required SigninAuth signinAuth});

  Future<void> signup({required SignupAuth signupAuth});

  Future<User?> exists({required Email email});
}
