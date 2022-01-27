import 'failure.dart';

class DomainFailure extends Failure {
  const DomainFailure({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
