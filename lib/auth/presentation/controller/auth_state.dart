import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final AsyncValue<String?> value;
  final TextEditingController emailAddressController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  AuthState({
    this.value = const AsyncValue.data(null),
    required this.emailAddressController,
    required this.passwordController,
    required this.formKey,
  });

  AuthState copyWith({
    AsyncValue<String?>? value,
    GlobalKey<FormState>? formKey,
  }) =>
      AuthState(
        emailAddressController: emailAddressController,
        passwordController: passwordController,
        value: value ?? this.value,
        formKey: formKey ?? GlobalKey<FormState>(),
      );

  bool get isLoading => value.isLoading;
}
