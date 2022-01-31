import 'package:shelf_modular/shelf_modular.dart';

import 'domain/usecases/signin_usecase_impl.dart';
import 'domain/usecases/signup_usecase_impl.dart';
import 'external/datasource/user_datasource_impl.dart';
import 'infra/repositories/autentication_repository_impl.dart';
import 'resources/autenticatioin_resource.dart';

class AutenticationiModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => UserDatasourceImpl(i())),
        Bind((i) => AutenticationRepositoryImpl(i())),
        Bind((i) => SigninUsecaseImpl(i())),
        Bind((i) => SignupUsecaseImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        Route.resource("/", resource: AutenticationResource()),
      ];
}
