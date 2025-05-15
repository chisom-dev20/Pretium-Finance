import 'package:flutter/material.dart';
import 'package:pretium_finance/pages/forgot_password_page.dart';
import 'package:pretium_finance/pages/home_page.dart';
import 'package:pretium_finance/resources/app_colors.dart';

class NavigationHostPage extends StatefulWidget {
  const NavigationHostPage({super.key});

  @override
  State<NavigationHostPage> createState() => _NavigationHostPageState();
}

class _NavigationHostPageState extends State<NavigationHostPage> {
  int currentPage = 0;

  final List<Widget> pages = const [
    HomePage(),
    ForgotPasswordPage()
  ];

  final List<IconData> navItems = [
    Icons.account_balance_wallet,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      // floatingActionButton: currentPage == 0
      //     ? FloatingActionButton(
      //         onPressed: () {},
      //         child: const Icon(Icons.add, color: Colors.white),
      //       )
      //     : null,
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  Widget buildBottomNavIcon({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: isSelected
                ? BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(16.0),
                  )
                : null,
            child: IconButton(
              color: isSelected ? AppColors.primaryColor : Colors.grey,
              onPressed: onPressed,
              icon: Icon(icon, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
