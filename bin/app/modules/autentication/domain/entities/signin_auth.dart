import '../../../../shared/domain/entities/entitiy.dart';

class SigninAuth extends Entity {
  final String user;
  final String pass;

  const SigninAuth({
    required this.user,
    required this.pass,
  });

  @override
  List<Object?> get props => [user, pass];
}
