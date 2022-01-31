import 'dart:convert';

import 'package:shelf_modular/shelf_modular.dart';
import 'package:shelf/shelf.dart';

import '../../../shared/domain/helpers/errors/failure.dart';
import '../../../shared/domain/value_objects/email.dart';
import '../../../shared/domain/value_objects/password.dart';
import '../../../shared/domain/value_objects/token.dart';
import '../../../shared/infra/datasource/token_datasource.dart';
import '../domain/entities/signin_auth.dart';
import '../domain/entities/signup_auth.dart';
import '../domain/usecases/signin_usecase.dart';
import '../domain/usecases/signup_usecase.dart';

class AutenticationResource extends Resource {
  @override
  List<Route> get routes => [
        Route.get("/verifyToken", verifyToken),
        Route.post("/signin", signin),
        Route.post("/signup", signup),
      ];

  Future<Response> verifyToken(Request req, Injector injector, ModularArguments args) async {
    final tokenDatasource = injector.get<TokenDatasource>();
    final data = req.headers;

    if (!data.containsKey('authorization')) {
      return Response.notFound(jsonEncode({'message': "Token inválido."}));
    }

    try {
      tokenDatasource.veryfied(token: Token(value: data['authorization']!));
      return Response.ok(jsonEncode({'data': 'success'}));
    } on Failure catch (e) {
      return Response.notFound(jsonEncode({'message': e.message}));
    }
  }

  Future<Response> signin(Request req, Injector injector, ModularArguments args) async {
    final usecase = injector.get<SigninUsecase>();

    final body = args.data;

    if (body == null || (body as Map).isEmpty) {
      return Response.notFound(jsonEncode({'message': "Usuário não encontrado"}));
    }

    final result = await usecase(
      signinAuth: SigninAuth(
        email: Email(value: body['email']),
        pass: Password(value: body['pass']),
      ),
    );

    return result.fold(
      (l) => Response.notFound(jsonEncode({'message': l.message})),
      (r) => Response.ok(jsonEncode({'data': r})),
    );
  }

  Future<Response> signup(Request req, Injector injector, ModularArguments args) async {
    final usecase = injector.get<SignupUsecase>();

    final body = args.data;

    if (body == null || (body as Map).isEmpty) {
      return Response.notFound(jsonEncode({'message': "Dados não encontrado."}));
    }

    final result = await usecase(
      signupAuth: SignupAuth(
        name: body['name'],
        email: Email(value: body['email']),
        pass: Password(value: body['pass']),
      ),
    );

    return result.fold(
      (l) => Response.notFound(jsonEncode({'message': l.message})),
      (r) => Response.ok(jsonEncode({'data': 'success'})),
    );
  }
}
