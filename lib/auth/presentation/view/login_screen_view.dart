import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_structure_with_riverpod/auth/presentation/controller/auth_controller.dart';
import 'package:project_structure_with_riverpod/generated/assets.dart';
import 'package:project_structure_with_riverpod/utils/utils.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});
  static const routeName = "LoginScreenView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 70.h),
          child: const LoginViewSection(),
        ),
      ),
    );
  }
}

class LoginViewSection extends ConsumerWidget {
  const LoginViewSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authControllerProvider);
    final controller = ref.read(authControllerProvider.notifier);

    ref.listen<AsyncValue<String?>>(authControllerProvider.select((value) => value.value), (_, sta) {
      if (!sta.isLoading && sta.hasError) {
        if (sta.asError?.error.runtimeType == Failures) {
          Failures failures = sta.asError?.error as Failures;
          showCustomSnackBar(context, message: failures.msg);
        } else {
          showCustomSnackBar(context, message: sta.asError?.error.toString() ?? '');
        }
      } else if (sta.hasValue == true && sta.asData?.value != null && sta.asData!.value!.isNotEmpty) {
        showCustomSnackBar(context, message: sta.asData?.value.toString() ?? '');
        // Navigator.pushReplacementNamed(context, MainScreenView.routeName);
      }
    });

    return SingleChildScrollView(
      child: Form(
        key: state.formKey,
        child: Column(
          children: [
            /// smiley icon
            Image.asset(Assets.iconsSmile, height: 137.sp, width: 150.sp),
            SizedBox(height: 30.h),

            /// welcome title
            const CustomText.secondary30W400(text: StringConstants.welcomeBack),
            SizedBox(height: 45.h),

            /// email text input field
            CustomTextField(
              controller: state.emailAddressController,
              hintText: StringConstants.email,
              readOnly: state.isLoading,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return StringConstants.emailValidator;
                } else if (!(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? ''))) {
                  return StringConstants.emailValidValidator;
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),

            /// password text input field
            CustomTextField(
              controller: state.passwordController,
              hintText: StringConstants.password,
              readOnly: state.isLoading,
              textInputAction: TextInputAction.done,
              obscureText: true,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return StringConstants.passwordValidator;
                } else if (!(RegExp(r"^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()-_+=])[A-Za-z\d!@#$%^&*()-_+=]{8,}$").hasMatch(value ?? ''))) {
                  return StringConstants.passwordValidValidator;
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),

            /// forget password
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                color: Colors.transparent,
                child: const CustomText.secondary16W400(text: StringConstants.forgotPassword),
              ),
            ),
            SizedBox(height: 40.h),

            /// login button
            CustomBlueButton(
              title: StringConstants.login,
              onTap: () => controller.login(),
              showLoading: state.isLoading,
            ),
            SizedBox(height: 50.h),

            /// or
            Row(
              children: [
                /// divider
                Expanded(
                  child: Divider(
                    height: 1.sp,
                    color: ColorConstants.secondaryColor.withOpacity(0.21),
                  ),
                ),
                SizedBox(width: 10.w),

                /// or text
                const CustomText.secondary20W400(text: StringConstants.or),

                /// divider
                SizedBox(width: 10.w),
                Expanded(
                  child: Divider(
                    height: 1.sp,
                    color: ColorConstants.secondaryColor.withOpacity(0.21),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),

            /// social icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// facebook
                Container(
                  height: 60.sp,
                  width: 60.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: ColorConstants.secondaryColor),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(Assets.iconsFacebook, height: 30.sp, width: 30.sp),
                ),
                SizedBox(width: 25.w),

                /// google
                Container(
                  height: 60.sp,
                  width: 60.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: ColorConstants.secondaryColor),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(Assets.iconsGoogle, height: 30.sp, width: 30.sp),
                ),
                SizedBox(width: 25.w),

                /// apple
                Container(
                  height: 60.sp,
                  width: 60.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: ColorConstants.secondaryColor),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(Assets.iconsApple, height: 30.sp, width: 30.sp),
                ),
              ],
            ),
            SizedBox(height: 50.h),

            /// dont have and account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// dont have and account
                const CustomText.secondary18W400(text: StringConstants.dontHaveAnAccount),
                SizedBox(width: 5.w),
                const CustomText.secondary18W700(text: StringConstants.signUp)
              ],
            )
          ],
        ),
      ),
    );
  }
}
