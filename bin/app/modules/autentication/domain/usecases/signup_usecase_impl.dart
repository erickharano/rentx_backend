import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/domain/usecases/usecase.dart';
import '../entities/signup_auth.dart';
import '../repositories/autentication_repository.dart';
import 'signup_usecase.dart';

class SignupUsecaseImpl extends Usecase implements SignupUsecase {
  final AutenticationRepository _repository;

  const SignupUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call({required SignupAuth signupAuth}) async {
    final error = getMultiFails([
      signupAuth.email,
      signupAuth.pass,
    ]);

    if (error != null) {
      return Left(error);
    }

    final response = await _repository.signup(signupAuth: signupAuth);

    return response;
  }
}
