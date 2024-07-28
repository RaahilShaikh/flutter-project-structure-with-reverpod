import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_structure_with_riverpod/auth/auth.dart';

class AuthService {
  final AuthRepository authRepository;

  AuthService({required this.authRepository});

  Future<LoginResponseData?> login({required Map<String, dynamic> param}) async {
    try {
      return await authRepository.login(param: param);
    } catch (e) {
      rethrow;
    }
  }

  Future<SuccessErrorModel?> changePassword({required Map<String, dynamic> param}) async {
    try {
      return await authRepository.changePassword(param: param);
    } catch (e) {
      rethrow;
    }
  }

  Future<SuccessErrorModel?> logout() async {
    try {
      return await authRepository.logout();
    } catch (e) {
      rethrow;
    }
  }
}

final authServiceProvider = Provider<AuthService>((ref) => AuthService(authRepository: IAuthRepository()));
