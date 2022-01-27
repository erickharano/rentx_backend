import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

import 'shared/external/database/mongo.dart';

class AppModule extends Module {
  final MongoHelper database;

  AppModule({
    required this.database,
  });

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => database),
      ];

  @override
  List<ModularRoute> get routes => [
        Route.resource("/", resource: Teste()),
      ];
}

class Teste extends Resource {
  @override
  List<Route> get routes => [
        Route.post("/", _rootHandler),
      ];

  Future<Response> _rootHandler(Request req, Injector injector, ModularArguments args) async {
    final database = injector.get<MongoHelper>();

    final body = args.data as Map<String, dynamic>;

    final response = await database.getCollection("usuario").insert(body);

    return Response(200, body: jsonEncode(response));
  }
}
