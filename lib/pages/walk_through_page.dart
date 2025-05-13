import 'package:flutter/material.dart';
import 'package:pretium_finance/components/app_buttons.dart';
import 'package:pretium_finance/components/slide_indicator.dart';
import 'package:pretium_finance/pages/login_page.dart';
import 'package:pretium_finance/resources/app_colors.dart';
import 'package:pretium_finance/resources/app_strings.dart';
import 'package:pretium_finance/resources/models/ui_models.dart';
import 'package:pretium_finance/resources/navigation/navigation.dart';

class WalkThroughPage extends StatefulWidget {
  const WalkThroughPage({super.key});

  @override
  State<WalkThroughPage> createState() => _WalkThroughPageState();
}

class _WalkThroughPageState extends State<WalkThroughPage> {
  late PageController _pageController;
  int _currentPage = 0;

  final Duration _slideAnimationDuration = const Duration(milliseconds: 300);

  final List<Carousel> _slideList = [
    Carousel(
        icon: Icons.credit_card,
        title: AppStrings.walkthroughTitle1,
        subTitle: AppStrings.walkthroughSubTitle1),
    Carousel(
        icon: Icons.account_balance_wallet_rounded,
        title: AppStrings.walkthroughTitle2,
        subTitle: AppStrings.walkthroughSubTitle2),
    Carousel(
        icon: Icons.receipt_long_rounded,
        title: AppStrings.walkthroughTitle3,
        subTitle: AppStrings.walkthroughSubTitle3),
  ];

  bool userControl = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 18, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigation.navigateToScreen(
                      context: context, screen: const LoginPage());
                },
                child: const Text(
                  'Skip',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  padEnds: false,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _slideList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        userControl = true;
                      });
                    },
                    onHorizontalDragUpdate: (drag) {
                      setState(() {
                        userControl = true;
                      });

                      if (drag.primaryDelta! < 0) {
                        if (_currentPage != _slideList.length - 1) {
                          _pageController.nextPage(
                            duration: _slideAnimationDuration,
                            curve: Curves.easeIn,
                          );
                        }
                      } else {
                        if (_currentPage != 0) {
                          _pageController.previousPage(
                            duration: _slideAnimationDuration,
                            curve: Curves.easeIn,
                          );
                        }
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 110,
                          width: 110,
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary50),
                          child: Icon(
                            _slideList[index].icon,
                            color: AppColors.primaryColor,
                            size: 60,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          _slideList[index].title,
                          style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _slideList[index].subTitle,
                          style: const TextStyle(
                              color: AppColors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: SlideIndicator(
                    selectedIndex: _currentPage, slideList: _slideList),
              ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: PrimaryButton(
                  onTap: () {
                    if (_currentPage == _slideList.length - 1) {
                      Navigation.navigateToScreen(
                          context: context, screen: const LoginPage());
                    }
                    _pageController.nextPage(
                      duration: _slideAnimationDuration,
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(_currentPage == _slideList.length - 1
                      ? 'Get Started'
                      : 'Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
