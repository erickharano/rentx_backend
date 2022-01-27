import '../../domain/entities/signup_auth.dart';
import '../helpers/errors/signup_auth_mapper_failure.dart';

class SignupAuthMapper {
  Map<String, dynamic> from(SignupAuth entity) {
    try {
      return {
        'nome': entity.name,
        'email': entity.email.value,
        'pass': entity.pass.hash,
      };
    } catch (error, stackTrace) {
      throw SignupAuthMapperFailure(
        message: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
