import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import '../entities/signin_auth.dart';

abstract class SigninUsecase {
  Future<Either<Failure, String>> call({
    required SigninAuth signinAuth,
  });
}
