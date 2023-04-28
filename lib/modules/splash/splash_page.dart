import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers/app_init_data_provider.dart';
import '../../app/providers/app_settings_provider.dart';
import '../../global/gen/fonts.gen.dart';
import '../../global/gen/i18n.dart';
import '../../global/routers/app_router.dart';
import '../../global/themes/app_colors.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final getAppSetting = ref.read(appSettingProvider);
      await ref.watch(appInitDataProvider.future);

      if (mounted) {
        if (getAppSetting.isFirstLaunch) {
          AutoRouter.of(context).replaceAll(
            [const OnboardingRoute()],
          );
        } else {
          AutoRouter.of(context).replaceAll(
            [const HomeRoute()],
          );
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final i18n = I18n.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              i18n.splash_Title,
              style: const TextStyle(
                fontSize: 44,
                color: AppColors.white,
                fontFamily: FontFamily.dancingScript,
                fontWeight: FontWeight.bold,
                height: 0,
              ),
            ),
            Text(
              i18n.splash_Subtitle,
              style: theme.textTheme.headlineLarge?.copyWith(
                color: AppColors.secondaryDefault,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
