import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/signup_auth.dart';

abstract class SignupUsecase {
  Future<Either<Failure, Unit>> call({
    required SignupAuth signupAuth,
  });
}
