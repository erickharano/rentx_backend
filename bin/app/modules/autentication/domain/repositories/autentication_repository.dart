import 'package:dartz/dartz.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/signin_auth.dart';
import '../entities/signup_auth.dart';

abstract class AutenticationRepository {
  Future<Either<Failure, String>> signin({required SigninAuth signinAuth});

  Future<Either<Failure, Unit>> signup({required SignupAuth signupAuth});
}
