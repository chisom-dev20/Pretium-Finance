import 'package:flutter/material.dart';
import 'package:pretium_finance/components/app_buttons.dart';
import 'package:pretium_finance/components/app_form_fields.dart';
import 'package:pretium_finance/pages/onboarding/login_page.dart';
import 'package:pretium_finance/resources/app_colors.dart';
import 'package:pretium_finance/resources/app_strings.dart';
import 'package:pretium_finance/resources/navigation/navigation.dart';
import 'package:pretium_finance/resources/utils/general_utils.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }

  String emptyValidatorText(String label) {
    return 'Please enter your ${label.toLowerCase()}';
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const Text(
                      AppStrings.resetPassword,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      AppStrings.enterTheCodeSentToYourEmail,
                      style: TextStyle(color: AppColors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 32),
                    PrimaryTextFormField(
                      labelText: AppStrings.resetCode,
                      labelTextColor: AppColors.primaryColor,
                      hintText: AppStrings.enter4DigitResetCode,
                      prefixWidget: const Icon(Icons.lock_reset_outlined),
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return emptyValidatorText(AppStrings.resetCode);
                        }
                        return null;
                      }
                    ),
                    PrimaryTextFormField(
                      labelText: AppStrings.newPassword,
                      labelTextColor: AppColors.primaryColor,
                      hintText: AppStrings.enterNewPassword,
                      prefixWidget: const Icon(Icons.lock_outline_rounded),
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      obscureText: !isPasswordVisible,
                      suffixWidget: IconButton(
                        onPressed: togglePasswordVisibility,
                        icon: Icon(isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                      ),
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return emptyValidatorText(AppStrings.newPassword);
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      }
                    ),
                    PrimaryTextFormField(
                      labelText: AppStrings.confirmPassword,
                      labelTextColor: AppColors.primaryColor,
                      hintText: AppStrings.confirmNewPassword,
                      prefixWidget: const Icon(Icons.lock_outline_rounded),
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 1,
                      obscureText: !isConfirmPasswordVisible,
                      suffixWidget: IconButton(
                        onPressed: toggleConfirmPasswordVisibility,
                        icon: Icon(isConfirmPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return emptyValidatorText(AppStrings.confirmPassword);
                        }
                        if(value != passwordController.text) {
                          return 'Password does not match';
                        }
                        return null;
                      }
                    ),
                    const SizedBox(height: 10),
                    PrimaryButton(
                      onTap: () {
                        if (_formKey.currentState?.validate() == true) {
                          Utils.showCustomAlert(
                            context: context,
                            title: 'Password Reset Successful',
                            content: 'Your password has been reset successfully. Please log in with your new password.',
                            buttonText: 'Login',
                            onPressed: () {
                              Navigation.navigateToScreenAndClearAllPrevious(
                                context: context,
                                screen: const LoginPage(),
                              );
                            }
                          );
                        } else {
                          setState(() {
                            _autovalidateMode =
                                AutovalidateMode.onUserInteraction;
                          });
                        }
                      },
                      child: const Text(AppStrings.resetPassword),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
