import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/localization/l10n.dart';

import '../flavors.dart';
import '../global/gen/i18n.dart';
import '../global/routers/app_router.dart';
import '../global/routers/auth_guard.dart';
import '../global/themes/app_themes.dart';
import 'providers/app_fcm_provider.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  late final _appRouter = AppRouter(
    authGuard: AuthGuard(),
  );

  @override
  Widget build(BuildContext context) {
    FormBuilderLocalizations.delegate.load(const Locale('en', 'US'));

    return MaterialApp.router(
      title: FlavorConfig.title,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: I18n.delegate.supportedLocales,
      // locale: ref.watch(appSettingProvider).locale.toLocale(),
      locale: const Locale('vi', 'VN'),
      localeResolutionCallback: I18n.delegate.resolution(
        fallback: const Locale('en', 'US'),
      ),
      theme: AppThemes.light(),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        if (FirebaseAuth.instance.currentUser != null) {
          ref.read(appFCMProvider.notifier).upsertFCMToken();
        }
        break;
      default:
    }
  }
}
