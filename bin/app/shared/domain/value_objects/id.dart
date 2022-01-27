import 'package:mongo_dart/mongo_dart.dart';

import 'value_object.dart';

class Id extends ValueObject<ObjectId> {
  const Id({
    required ObjectId objectId,
  }) : super(value: objectId);

  factory Id.parse({required String value}) {
    return Id(objectId: ObjectId.parse(value));
  }

  @override
  bool get isValid => true;

  @override
  String get message => "ID inválido";
}
