import '../../../../../shared/domain/helpers/errors/failure.dart';

class UserMapperFailure extends Failure {
  const UserMapperFailure({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
