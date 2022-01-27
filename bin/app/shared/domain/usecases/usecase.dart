import '../helpers/errors/domain_failure.dart';
import '../value_objects/value_object.dart';

abstract class Usecase {
  const Usecase();

  DomainFailure? getMultiFails(List<ValueObject> values) {
    for (final ValueObject value in values) {
      if (!value.isValid) {
        return DomainFailure(
          message: value.message,
          stackTrace: StackTrace.current,
        );
      }
    }

    return null;
  }
}
