import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'app_router.dart';

class AuthGuard extends AutoRedirectGuard {
  AuthGuard() {
    FirebaseAuth.instance.userChanges().listen((event) {
      reevaluate();
    });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await canNavigate(resolver.route)) return resolver.next();
    await router.replaceAll([
      const SignInRoute(),
    ]);
  }

  @override
  Future<bool> canNavigate(RouteMatch route) async {
    return FirebaseAuth.instance.currentUser != null;
  }
}
