import 'package:jaguar_jwt/jaguar_jwt.dart';

import '../../domain/value_objects/token.dart';
import '../../environment.dart';
import '../../infra/datasource/token_datasource.dart';
import '../../infra/helpers/erros/datasource_failure.dart';

class JsonWebTokenDatasourceImpl implements TokenDatasource {
  @override
  String generate({required String id}) {
    try {
      final claimSet = JwtClaim(
        issuer: Environment.jwtissuer,
        subject: id,
        maxAge: Duration(minutes: 1), // tempo de validação do token
      );

      return "Bearer ${issueJwtHS256(claimSet, Environment.keySeg)}";
    } on JwtException catch (error) {
      throw DatasourceFailure(
        message: error.message,
        stackTrace: StackTrace.current,
      );
    } catch (error, stackTrace) {
      throw DatasourceFailure(
        message: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  void veryfied({required Token token}) {
    try {
      final decClaimSet = verifyJwtHS256Signature(token.toFormat, Environment.keySeg);
      final json = decClaimSet.toJson();
      final now = DateTime.now().toUtc();

      if (!(json.containsKey('sub') && json['sub'] != null)) {
        throw "Token JWT inválido. Não encontrado no Header.";
      }

      if (decClaimSet.expiry != null && now.isAfter(decClaimSet.expiry!)) {
        throw "Token JWT expirou.";
      }
    } on JwtException catch (error) {
      throw DatasourceFailure(
        message: error.message,
        stackTrace: StackTrace.current,
      );
    } catch (error, stackTrace) {
      throw DatasourceFailure(
        message: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
