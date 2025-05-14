import 'package:flutter/material.dart';
import 'package:pretium_finance/components/app_buttons.dart';
import 'package:pretium_finance/components/app_form_fields.dart';
import 'package:pretium_finance/pages/sign_up_page.dart';
import 'package:pretium_finance/resources/app_colors.dart';
import 'package:pretium_finance/resources/app_strings.dart';
import 'package:pretium_finance/resources/navigation/navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;
  bool rememberMe = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void toggleRememberMe() {
    setState(() {
      rememberMe = !rememberMe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 80, right: 24),
          child: ListView(
            // padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.account_balance_wallet_rounded,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                AppStrings.welcomeBack,
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
              const Text(
                AppStrings.signInToContinue,
                style: TextStyle(
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 45),
              const PrimaryTextFormField(
                prefixWidget: Icon(Icons.email_outlined),
                labelText: AppStrings.email,
                labelTextColor: AppColors.textFieldHintTextColor,
                hintText: AppStrings.enterYourEmail,
              ),
              PrimaryTextFormField(
                prefixWidget: const Icon(Icons.lock_outline_rounded),
                obscureText: !isPasswordVisible,
                suffixWidget: IconButton(
                  onPressed: togglePasswordVisibility,
                  icon: Icon(isPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                ),
                labelText: AppStrings.password,
                labelTextColor: AppColors.textFieldHintTextColor,
                hintText: AppStrings.enterYourPassword,
              ),
              // const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: toggleRememberMe,
                        icon: Icon(
                          rememberMe
                              ? Icons.check_box
                              : Icons.check_box_outline_blank_rounded,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const Text(
                        AppStrings.rememberMe,
                        style: TextStyle(color: AppColors.grey),
                      )
                    ],
                  ),
                  const Text(
                    AppStrings.forgotPassword,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(height: 24),
              const PrimaryButton(
                child: Text(AppStrings.login),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.dontHaveAnAccount,
                    style: TextStyle(color: AppColors.grey),
                  ),
                  const SizedBox(width: 4),
                  TextButton(
                    onPressed: () {
                      Navigation.navigateToScreen(
                          context: context, screen: const SignUpPage());
                    },
                    child: const Text(
                      AppStrings.signUp,
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
