import 'package:flutter/material.dart';
import 'package:pretium_finance/components/app_buttons.dart';
import 'package:pretium_finance/components/app_form_fields.dart';
import 'package:pretium_finance/resources/app_colors.dart';
import 'package:pretium_finance/resources/app_strings.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 20),
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
                  const PrimaryTextFormField(
                    labelText: AppStrings.resetCode,
                    labelTextColor: AppColors.primaryColor,
                    hintText: AppStrings.enter4DigitResetCode,
                    prefixWidget: Icon(Icons.lock_reset_outlined),
                    keyboardType: TextInputType.number,
                    maxLines: 1,
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
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(
                    onTap: () {},
                    child: const Text(AppStrings.resetPassword),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
