
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/data/models/failure.dart';
import '../../global/data/repositories/user_repository.dart';
import '../../global/utils/riverpod/app_state.dart';

final appFCMProvider = StateNotifierProvider(AppFCMProvider.new);

class AppFCMProvider extends StateNotifier<AppState<Unit>> {
  AppFCMProvider(this.ref) : super(AppState.loading());

  void init({
    required ValueChanged<RemoteMessage?> onMessageOpenedApp,
    required ValueChanged<RemoteMessage?> onMessage,
  }) {
    // Handle message open app when app is using
    final onMessageStream = FirebaseMessaging.onMessage.listen(onMessage);
    // Handle message open app when app is running in background
    final onBackgroundMessageStream =
        FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpenedApp);
    // Handle message open app when app terminated
    FirebaseMessaging.instance.getInitialMessage().then(onMessageOpenedApp);

    final authStream = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        upsertFCMToken();
      }
    });
    ref.onDispose(() {
      authStream.cancel();
      onMessageStream.cancel();
      onBackgroundMessageStream.cancel();
    });
  }

  final Ref ref;
  late final userRepository = ref.watch(userRepositoryProvider);

  void upsertFCMToken() async {
    try {
      final settings = await FirebaseMessaging.instance.requestPermission();
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        final token = await FirebaseMessaging.instance.getToken();
        if (token != null) {
          userRepository.updateMe(fcmToken: token).then(
                (either) => either.leftMap(
                  (l) => state = AppState.error(l),
                ),
              );
        }
      }
    } catch (e) {
      log(e.toString());
      state = AppState.error(Failure.unknown(e));
    }
  }
}
