import '../../../../shared/domain/value_objects/id.dart';
import '../../domain/entities/user.dart';
import '../helpers/errors/user_mapper_failure.dart';

class UserMapper {
  User to(Map<String, dynamic> data) {
    try {
      return User(
        id: Id(objectId: data['_id']),
        name: data['name'],
        email: data['email'],
        pass: data['pass'],
      );
    } catch (error, stackTrace) {
      throw UserMapperFailure(
        message: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
