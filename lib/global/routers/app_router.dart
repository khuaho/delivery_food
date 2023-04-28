import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../modules/home/home_page.dart';
import '../../modules/onboarding/onboarding_page.dart';
import '../../modules/signin/signin_page.dart';
import '../../modules/splash/splash_page.dart';
import 'auth_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      path: '/signin',
      page: SignInPage,
    ),
    // AutoRoute(
    //   path: '/signup',
    //   page: SignUpPage,
    // ),
    AutoRoute(
      path: '/onboarding',
      page: OnboardingPage,
    ),
    AutoRoute(
      path: '/home',
      page: HomePage,
      guards: [AuthGuard],
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({
    required super.authGuard,
  });
}
