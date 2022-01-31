import 'package:mongo_dart/mongo_dart.dart';

import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/external/database/mongo.dart';
import '../../../../shared/infra/helpers/erros/datasource_failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/signup_auth.dart';
import '../../domain/entities/signin_auth.dart';
import '../../../../shared/domain/value_objects/email.dart';
import '../../infra/datasources/user_datasource.dart';
import '../mappers/signup_auth_mapper.dart';
import '../mappers/user_mapper.dart';

class UserDatasourceImpl implements UserDatasource {
  final MongoHelper _database;

  const UserDatasourceImpl(this._database);

  @override
  Future<User?> exists({required Email email}) async {
    try {
      final response = await _database.getCollection("user").findOne(where.eq("email", email.value));
      if (response == null) return null;

      return UserMapper().to(response);
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
        message: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<User> findOne({required SigninAuth signinAuth}) async {
    try {
      final user = await exists(email: signinAuth.email);
      if (user == null) {
        throw DatasourceFailure(
          message: "Usuário não encontrado.",
          stackTrace: StackTrace.current,
        );
      }

      if (user.pass != signinAuth.pass.hash) {
        throw DatasourceFailure(
          message: "E-mail ou senha inválido.",
          stackTrace: StackTrace.current,
        );
      }

      return user;
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
        message: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> create({required SignupAuth signupAuth}) async {
    try {
      final user = await exists(email: signupAuth.email);
      if (user is User) {
        throw DatasourceFailure(
          message: "E-mail já está em uso.",
          stackTrace: StackTrace.current,
        );
      }

      await _database.getCollection("user").insert(SignupAuthMapper().from(signupAuth));
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
        message: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
