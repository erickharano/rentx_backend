import 'package:dartz/dartz.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/domain/usecases/usecase.dart';
import '../entities/signin_auth.dart';
import '../repositories/autentication_repository.dart';
import 'signin_usecase.dart';

class SigninUsecaseImpl extends Usecase implements SigninUsecase {
  final AutenticationRepository _repository;

  const SigninUsecaseImpl(this._repository);

  @override
  Future<Either<Failure, String>> call({required SigninAuth signinAuth}) async {
    final error = getMultiFails([
      signinAuth.email,
      signinAuth.pass,
    ]);

    if (error != null) {
      return Left(error);
    }

    final response = await _repository.signin(signinAuth: signinAuth);

    return response;
  }
}
