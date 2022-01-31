import 'dart:convert';

import 'package:shelf_modular/shelf_modular.dart';
import 'package:shelf/shelf.dart';

import '../../../shared/domain/value_objects/email.dart';
import '../../../shared/domain/value_objects/password.dart';
import '../domain/entities/signin_auth.dart';
import '../domain/entities/signup_auth.dart';
import '../domain/usecases/signin_usecase.dart';
import '../domain/usecases/signup_usecase.dart';

class AutenticationResource extends Resource {
  @override
  List<Route> get routes => [
        Route.post("/signin", signin),
        Route.post("/signup", signup),
      ];

  Future<Response> signin(Request req, Injector injector, ModularArguments args) async {
    final usecase = injector.get<SigninUsecase>();

    final body = args.data;

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

    final result = await usecase(
      signupAuth: SignupAuth(
        name: body['name'],
        email: Email(value: body['email']),
        pass: Password(value: body['pass']),
      ),
    );

    return result.fold(
      (l) => Response.notFound(jsonEncode({'message': l.message})),
      (r) => Response.ok(jsonEncode({'data': r})),
    );
  }
}
