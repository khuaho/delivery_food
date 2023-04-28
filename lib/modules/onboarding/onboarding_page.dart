import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../app/providers/app_settings_provider.dart';
import '../../global/gen/assets.gen.dart';
import '../../global/gen/i18n.dart';
import '../../global/routers/app_router.dart';
import '../../global/themes/app_colors.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final pageController = PageController();
  bool isLastPage = false;

  List<AssetGenImage> onboardImages = [
    Assets.images.intro1,
    Assets.images.intro2,
    Assets.images.intro3,
  ];

  void onPageViewChange(int page) {
    setState(() {
      isLastPage = page == onboardImages.length - 1;
    });
  }

  void handleSkipLaunch() {
    if (!mounted) return;
    ref.watch(appSettingProvider.notifier).saveFirstLaunch();

    AutoRouter.of(context).replaceAll(
      [const HomeRoute()],
    );
  }

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.of(context)!;
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: onPageViewChange,
                children: List.generate(
                  onboardImages.length,
                  (index) => page(i18n, index),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: isLastPage ? 0 : 1,
                    child: TextButton(
                      onPressed: isLastPage ? null : handleSkipLaunch,
                      child: Text(
                        i18n.onboarding_Skip,
                        style: theme.textTheme.headlineMedium
                            ?.copyWith(color: AppColors.neutral01),
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: onboardImages.length,
                    effect: const WormEffect(
                      activeDotColor: AppColors.secondaryDefault,
                      dotColor: Colors.black26,
                      dotWidth: 10,
                      dotHeight: 10,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (pageController.page! >= onboardImages.length - 1) {
                        handleSkipLaunch();
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastOutSlowIn,
                        );
                      }
                    },
                    child: Text(
                      isLastPage ? i18n.onboarding_Done : i18n.onboarding_Next,
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(color: AppColors.secondaryDefault),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget page(I18n i18n, int index) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          color: AppColors.primary,
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.6,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: onboardImages[index].image(
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Text(
            i18n.onboarding_Title[index],
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineLarge?.copyWith(color: Colors.black),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            i18n.onboarding_Description[index],
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.neutral02),
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
