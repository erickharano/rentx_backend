import 'package:shelf_modular/shelf_modular.dart';

import 'modules/autentication/autentication_module.dart';
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
        Route.module("/auth", module: AutenticationiModule()),
      ];
}
