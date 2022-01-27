import '../../../../../shared/domain/helpers/errors/failure.dart';

class SignupAuthMapperFailure extends Failure {
  const SignupAuthMapperFailure({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
