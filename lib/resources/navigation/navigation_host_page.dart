import 'package:flutter/material.dart';
import 'package:pretium_finance/pages/onboarding/forgot_password_page.dart';
import 'package:pretium_finance/pages/home_page.dart';
import 'package:pretium_finance/resources/app_colors.dart';

class NavigationHostPage extends StatefulWidget {
  const NavigationHostPage({super.key});

  @override
  State<NavigationHostPage> createState() => _NavigationHostPageState();
}

class _NavigationHostPageState extends State<NavigationHostPage> {
  int currentPage = 0;

  final List<Widget> pages = const [HomePage(), ForgotPasswordPage()];

  final List<IconData> navItems = [
    Icons.account_balance_wallet,
    Icons.article_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          pages[currentPage],
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    navItems.length,
                    (index) {
                      return buildBottomNavIcon(
                        icon: navItems[index],
                        isSelected: currentPage == index,
                        onPressed: () => setState(() => currentPage = index),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 29,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.qr_code_2,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavIcon({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        icon,
        color: isSelected ? AppColors.primaryColor : AppColors.grey,
        size: 35,
      ),
    );
  }
}
