import 'package:project_structure_with_riverpod/auth/auth.dart';
import 'package:project_structure_with_riverpod/utils/services/services.dart';

abstract class AuthRepository {
  Future<LoginResponseData?> login({required Map<String, dynamic> param});
  Future<SuccessErrorModel?> changePassword({required Map<String, dynamic> param});
  Future<SuccessErrorModel?> logout();
}

class IAuthRepository implements AuthRepository {
  APIBaseHelper apiBaseHelper = APIBaseHelper();

  @override
  Future<LoginResponseData?> login({required Map<String, dynamic> param}) async {
    try {
      final result = await apiBaseHelper.post(url: APIConstants.login, parameters: param);
      return LoginResponseData.fromJson(result.body);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SuccessErrorModel?> changePassword({required Map<String, dynamic> param}) async {
    try {
      final result = await apiBaseHelper.post(url: APIConstants.changePassword, parameters: param);
      return SuccessErrorModel.fromJson(result.body);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SuccessErrorModel?> logout() async {
    try {
      final result = await apiBaseHelper.get(url: APIConstants.logout);
      return SuccessErrorModel.fromJson(result.body);
    } catch (e) {
      rethrow;
    }
  }
}
