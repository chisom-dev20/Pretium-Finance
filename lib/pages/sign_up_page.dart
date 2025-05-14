import 'package:flutter/material.dart';
import 'package:pretium_finance/components/app_buttons.dart';
import 'package:pretium_finance/components/app_form_fields.dart';
import 'package:pretium_finance/pages/login_page.dart';
import 'package:pretium_finance/pages/verify_account_page.dart';
import 'package:pretium_finance/resources/app_colors.dart';
import 'package:pretium_finance/resources/app_strings.dart';
import 'package:pretium_finance/resources/navigation/navigation.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

const String termsAndConditionsUrl = 'https://pretium.africa/term-of-use';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  bool isPasswordVisible = false;
  bool openingTermsAndConditions = false;
  bool acceptTermsAndConditions = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void toggleAcceptTermsAndConditions() {
    setState(() {
      acceptTermsAndConditions = !acceptTermsAndConditions;
    });
  }

  void _launchURL() async {
    final Uri url = Uri.parse(termsAndConditionsUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not lauch $url';
    }
  }

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
                        AppStrings.createAccount,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        AppStrings.simplifyYourCryptoPaymentsWithUs,
                        style: TextStyle(color: AppColors.grey, fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      PrimaryTextFormField(
                        labelText: AppStrings.firstName,
                        prefixWidget: const Icon(Icons.person_outline_rounded),
                        hintText: AppStrings.enterYourFirstName,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return emptyValidatorText(AppStrings.firstName);
                          }
                          return null;
                        },
                      ),
                      PrimaryTextFormField(
                        labelText: AppStrings.lastName,
                        prefixWidget: const Icon(Icons.person_outline_rounded),
                        hintText: AppStrings.enterYourLastName,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return emptyValidatorText(AppStrings.lastName);
                          }
                          return null;
                        },
                      ),
                      PrimaryTextFormField(
                        labelText: AppStrings.email,
                        prefixWidget: const Icon(Icons.email_outlined),
                        hintText: AppStrings.enterYourEmail,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return emptyValidatorText(AppStrings.email);
                          }
                          if(!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      PrimaryTextFormField(
                        labelText: AppStrings.password,
                        obscureText: !isPasswordVisible,
                        prefixWidget: const Icon(Icons.lock_outline_rounded),
                        suffixWidget: IconButton(
                          onPressed: togglePasswordVisibility,
                          icon: Icon(isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                        ),
                        hintText: AppStrings.createAPassword,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return emptyValidatorText(AppStrings.password);
                          }
                          if(value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              toggleAcceptTermsAndConditions();
                            },
                            icon: Icon(
                              acceptTermsAndConditions
                                  ? Icons.check_box_rounded
                                  : Icons.check_box_outline_blank_rounded,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                openingTermsAndConditions =
                                    !openingTermsAndConditions;
                              });
                              _launchURL();
                              setState(() {
                                openingTermsAndConditions =
                                    !openingTermsAndConditions;
                              });
                            },
                            child: const Text(
                              AppStrings.acceptTermsAndConditions,
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      PrimaryButton(
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) {
                            setState(() {
                              _autovalidateMode = AutovalidateMode.onUserInteraction;
                            });
                            return;
                          }
                          bool? result = await Navigation.navigateToScreen(
                            context: context, 
                            screen: const VerifyAccountPage()
                          );
                          if(result == true) {
                            if(!mounted) return;
                            Navigation.navigateToScreen(
                              context: context, 
                              screen: const LoginPage()
                            );
                          }
                        },
                        child: const Text(AppStrings.createAccount),
                      ),
                      const SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            AppStrings.alreadyHaveAnAccount,
                            style: TextStyle(color: AppColors.grey),
                          ),
                          const SizedBox(width: 4),
                          TextButton(
                            onPressed: () {
                              Navigation.navigateToScreen(
                                  context: context, screen: const LoginPage());
                            },
                            child: const Text(
                              AppStrings.login,
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: openingTermsAndConditions,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: const Text(AppStrings.openingTermsAndConditions,
                      style: TextStyle(
                        color: AppColors.white,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
