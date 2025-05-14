import 'package:flutter/material.dart';
import 'package:pretium_finance/components/app_buttons.dart';
import 'package:pretium_finance/components/app_form_fields.dart';
import 'package:pretium_finance/pages/reset_password_page.dart';
import 'package:pretium_finance/resources/app_colors.dart';
import 'package:pretium_finance/resources/app_strings.dart';
import 'package:pretium_finance/resources/navigation/navigation.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                    AppStrings.forgotPasswordWithQuestionMark,
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    AppStrings.enterYourEmailAddressToReceiveAPasswordResetCode,
                    style: TextStyle(color: AppColors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  const PrimaryTextFormField(
                    labelText: AppStrings.email,
                    hintText: AppStrings.enterYourEmail,
                    prefixWidget:
                        Icon(Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10),
                  PrimaryButton(
                    onTap: () {
                      Navigation.navigateToScreen(
                          context: context, screen: const ResetPasswordPage());
                    },
                    child: const Text(AppStrings.sendResetCode),
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
