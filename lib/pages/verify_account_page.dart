import 'package:flutter/material.dart';
import 'package:pretium_finance/components/app_buttons.dart';
import 'package:pretium_finance/components/app_dropdown_field.dart';
import 'package:pretium_finance/components/app_form_fields.dart';
import 'package:pretium_finance/components/bottom_sheets.dart';
import 'package:pretium_finance/pages/create_pin_page.dart';
import 'package:pretium_finance/pages/select_country_bottom_sheet.dart';
import 'package:pretium_finance/resources/app_colors.dart';
import 'package:pretium_finance/resources/app_strings.dart';
import 'package:pretium_finance/resources/navigation/navigation.dart';

class VerifyAccountPage extends StatefulWidget {
  const VerifyAccountPage({super.key});

  @override
  State<VerifyAccountPage> createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends State<VerifyAccountPage> {
  String? selectedCountry;
  bool resendCode = false;

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
                      AppStrings.verifyAccount,
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      AppStrings.enterTheVerificationCodeSentToYourEmail,
                      style: TextStyle(color: AppColors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 32),
                    AppDropdownField(
                      hintText: AppStrings.selectCountry,
                      valueText: selectedCountry,
                      onTap: () async {
                        await showAppBottomSheet(
                          context: context,
                          title: AppStrings.selectCountry,
                          child: SelectCountryBottomSheet(
                            onCountrySelected: (country) {
                              setState(() {
                                selectedCountry = country;
                              });
                              Navigation.back(context: context);
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    const PrimaryTextFormField(
                      labelText: '1234',
                      labelTextColor: AppColors.primaryColor,
                      hintText: AppStrings.enter4DigitCode,
                      suffixWidget: Icon(Icons.security),
                      // errorText: 'Please enter verification code',
                    ),
                    const SizedBox(height: 10),
                    PrimaryButton(
                      onTap: () {
                        Navigation.navigateToScreen(
                            context: context, screen: const CreatePinPage());
                      },
                      child: const Text(AppStrings.verifyAccount),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          AppStrings.didntReceiveTheCode,
                          style: TextStyle(color: AppColors.black),
                        ),
                        const SizedBox(width: 4),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              resendCode = true;
                            });

                            Future.delayed(const Duration(seconds: 1), () {
                              if (mounted) {
                                setState(() {
                                  resendCode = false;
                                });
                              }
                            });
                          },
                          child: const Text(
                            AppStrings.resendCode,
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
              Visibility(
                visible: resendCode,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: const Text(
                    AppStrings.verificationCodeResent,
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
