import 'package:flutter/material.dart';
import 'package:pretium_finance/pages/home_page.dart';
import 'package:pretium_finance/resources/app_colors.dart';
import 'package:pretium_finance/resources/navigation/navigation.dart';

class CreatePinPage extends StatefulWidget {
  const CreatePinPage({super.key});

  @override
  State<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  String number = '';

  void numClick(String text) {
    if (number.length < 4) {
      setState(() {
        number += text;
      });
    }

    if (number.length == 4) {
      Navigation.navigateToScreen(context: context, screen: const HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 120, bottom: 20),
        child: Column(
          children: [
            const Text(
              'Hello, Chisom 👋',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            const Text(
              'Verify your PIN to unlock',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w200),
            ),
            const SizedBox(height: 38),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return pinContainer(
                      filled: index < number.length,
                      rightPadding: index != 3 ? 15 : 0.0);
                })),
            const SizedBox(height: 120),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberButton(
                  number: '1',
                  onTap: numClick,
                ),
                numberButton(
                  number: '2',
                  onTap: numClick,
                ),
                numberButton(
                  number: '3',
                  onTap: numClick,
                ),
              ],
            ),
            // const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberButton(
                  number: '4',
                  onTap: numClick,
                ),
                numberButton(
                  number: '5',
                  onTap: numClick,
                ),
                numberButton(
                  number: '6',
                  onTap: numClick,
                ),
              ],
            ),
            // const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numberButton(
                  number: '7',
                  onTap: numClick,
                ),
                numberButton(
                  number: '8',
                  onTap: numClick,
                ),
                numberButton(
                  number: '9',
                  onTap: numClick,
                ),
              ],
            ),
            // const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconButton(
                  icon: Icons.fingerprint,
                  onTap: () {
                    print("Fingerprint pressed");
                    //TODO: Trigger biometric auth
                  },
                ),
                numberButton(
                  number: '0',
                  onTap: numClick,
                ),
                iconButton(
                  icon: Icons.backspace,
                  onTap: () {
                    if (number.isNotEmpty) {
                      setState(() {
                        number = number.substring(0, number.length - 1);
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              'Forgot PIN?',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w200),
            )
          ],
        ),
      ),
    );
  }

  Widget pinContainer({double? rightPadding, bool filled = false}) {
    return Padding(
      padding: EdgeInsets.only(right: rightPadding ?? 15.0),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filled ? AppColors.white : AppColors.transparent,
            border: Border.all(color: AppColors.white)),
      ),
    );
  }

  Widget numberButton({required String number, required Function onTap}) {
    return InkWell(
      onTap: () {
        onTap(number);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppColors.transparent,
            shape: BoxShape.circle,
          ),
          child: Text(
            number,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 38,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }

  Widget iconButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppColors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
