import 'package:flutter/material.dart';
import 'package:pretium_finance/components/app_buttons.dart';
import 'package:pretium_finance/components/app_form_fields.dart';
import 'package:pretium_finance/pages/reset_password_page.dart';
import 'package:pretium_finance/resources/app_colors.dart';
import 'package:pretium_finance/resources/app_strings.dart';
import 'package:pretium_finance/resources/navigation/navigation.dart';
import 'package:pretium_finance/resources/utils/general_utils.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  TextEditingController emailController = TextEditingController();

  String emptyValidatorText(String label) {
    return 'Please enter your ${label.toLowerCase()}';
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
            Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: Expanded(
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
                      AppStrings
                          .enterYourEmailAddressToReceiveAPasswordResetCode,
                      style: TextStyle(color: AppColors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 32),
                    PrimaryTextFormField(
                      labelText: AppStrings.email,
                      hintText: AppStrings.enterYourEmail,
                      prefixWidget: const Icon(Icons.email_outlined),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return emptyValidatorText(AppStrings.email);
                        }
                        if (!RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    PrimaryButton(
                      onTap: () {
                        if (_formKey.currentState?.validate() == true) {
                          showCustomAlert(
                            context: context,
                            email: emailController.text,
                            onPressed: () {
                              Navigation.navigateToScreen(
                                  context: context,
                                  screen: const ResetPasswordPage());
                            },
                          );
                        } else {
                          setState(() {
                            _autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      child: const Text(AppStrings.sendResetCode),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
