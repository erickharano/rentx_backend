import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_modular/shelf_modular.dart';

import 'app/app_module.dart';
import 'app/shared/external/database/mongo.dart';

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final database = MongoHelper();
  await database.connect();

  // Configure a pipeline that logs requests.
  final _handler = Pipeline().addMiddleware(logRequests()).addHandler(Modular(module: AppModule(database: database)));

  final server = await serve(_handler, ip, port);
  print('Server listening on port ${server.port}');
}
