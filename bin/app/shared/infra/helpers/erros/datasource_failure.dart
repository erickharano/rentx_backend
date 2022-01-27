import '../../../domain/helpers/errors/failure.dart';

class DatasourceFailure extends Failure {
  const DatasourceFailure({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
