import 'package:flutter/material.dart';
import 'package:pretium_finance/resources/navigation/navigation.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:pretium_finance/resources/app_colors.dart';

class Utils {
  static hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void showCustomAlert({
    required BuildContext context,
    required String title,
    required String content,
    String? buttonText,
    VoidCallback? onPressed
  }) {
    Alert(
      context: context,
      type: AlertType.none,
      style: AlertStyle(
          titleStyle: const TextStyle(
            color: AppColors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          isCloseButton: false,
          isOverlayTapDismiss: true,
          overlayColor: Colors.black.withOpacity(0.5),
          alertBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          buttonAreaPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
      title: title,
      content: Column(
        children: [
          const SizedBox(height: 15),
          const Icon(
            Icons.check_circle_outline_outlined,
            color: Colors.green,
            size: 50,
          ),
          const SizedBox(height: 20),
          Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.grey, fontSize: 20),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          height: 50,
          onPressed: onPressed ??
              () {
                Navigation.back(context: context);
              },
          color: AppColors.primaryColor,
          radius: BorderRadius.circular(8),
          child: Text(
            buttonText ?? 'Continue',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    ).show();
  }
}