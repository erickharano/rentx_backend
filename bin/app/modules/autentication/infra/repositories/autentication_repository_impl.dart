import 'package:dartz/dartz.dart';

import '../../../../shared/infra/helpers/erros/datasource_failure.dart';
import '../../domain/entities/signup_auth.dart';
import '../../domain/entities/signin_auth.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/repositories/autentication_repository.dart';
import '../datasources/user_datasource.dart';

class AutenticationRepositoryImpl implements AutenticationRepository {
  final UserDatasource _datasource;

  const AutenticationRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, String>> signin({
    required SigninAuth signinAuth,
  }) async {
    try {
      final response = await _datasource.findOne(signinAuth: signinAuth);
      return Right(response.id.value.$oid);
    } on Failure catch (error) {
      return Left(error);
    } catch (error, stackTrace) {
      return Left(
        DatasourceFailure(
          message: error.toString(),
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> signup({required SignupAuth signupAuth}) async {
    try {
      await _datasource.create(signupAuth: signupAuth);
      return Right(unit);
    } on Failure catch (error) {
      return Left(error);
    } catch (error, stackTrace) {
      return Left(
        DatasourceFailure(
          message: error.toString(),
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
