import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_structure_with_riverpod/auth/auth.dart';
import 'package:project_structure_with_riverpod/utils/services/storage_service.dart';

final authControllerProvider = StateNotifierProvider.autoDispose<AuthController, AuthState>((ref) {
  final controller = AuthController(ref: ref);
  return controller;
});

class AuthController extends StateNotifier<AuthState> {
  AuthController({required this.ref})
      : super(
          AuthState(
            value: const AsyncValue.data(null),
            emailAddressController: TextEditingController(),
            passwordController: TextEditingController(),
            formKey: GlobalKey<FormState>(),
          ),
        );

  Ref ref;

  Future<void> login() async {
    if (state.formKey.currentState?.validate() ?? false) {
      debugPrint("Login calling...");
      try {
        state = state.copyWith(value: const AsyncValue.loading());

        Future.delayed(const Duration(seconds: 3),(){
          state = state.copyWith(value: const AsyncValue.data(''));
        });
        // Map<String, dynamic> payload = {
        //   "email": state.emailAddressController.text ?? '',
        //   "password": state.passwordController.text ?? '',
        // };
        //
        // await ref.read(authServiceProvider).login(param: payload).then((value) {
        //   if (value?.isSuccess == true) {
        //     StorageService.setAccessToken(value?.data?.accessToken ?? '');
        //     state = state.copyWith(value: AsyncValue.data(value?.message ?? ''));
        //   } else {
        //     state = state.copyWith(value: AsyncValue.error(value?.message ?? '', StackTrace.empty));
        //   }
        // });
      } catch (e, st) {
        debugPrint(e.toString());
        state = state.copyWith(value: AsyncValue.error(e, st));
      }
    }
  }
}
