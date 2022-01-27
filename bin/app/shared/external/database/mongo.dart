import 'package:mongo_dart/mongo_dart.dart';

import '../../environment.dart';

class MongoHelper {
  late final Db _database;
  late final GridFS _grid;

  Future<void> connect() async {
    _database = await Db.create(Environment.urlAccess);
    await _database.open();
    _grid = GridFS(_database, "images");
  }

  Future<void> disconnect() async {
    await _database.close();
  }

  DbCollection getCollection(String collection) {
    return _database.collection(collection);
  }

  DbCollection getStorageBucket() {
    return _grid.chunks;
  }
}
