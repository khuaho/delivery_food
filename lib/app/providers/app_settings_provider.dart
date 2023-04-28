import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/data/models/app_settings.dart';
import '../../global/data/repositories/app_settings_repository.dart';
import '../../global/enums/app_locale.dart';
import '../../global/enums/app_theme.dart';
import '../../global/gen/i18n.dart';

final appSettingProvider =
    StateNotifierProvider<AppSettingsProvider, AppSettings>(
  (ref) => AppSettingsProvider(
    ref.watch(appSettingsRepositoryProvider),
  ),
);

class AppSettingsProvider extends StateNotifier<AppSettings> {
  AppSettingsProvider(this._hiveService)
      : super(
          _hiveService.getAppSettings().fold(
                (l) => const AppSettings(),
                (r) => r,
              ),
        );

  final AppSettingsRepository _hiveService;

  ThemeData get themeData => state.theme.toThemeData();

  Locale get localeData => state.locale.toLocale();

  void changeTheme(AppTheme theme) async {
    _hiveService.saveTheme(theme).then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );
  }

  void changeLocale(AppLocale locale) async {
    await _hiveService.saveLocale(locale).then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );

    I18n.locale = locale.toLocale();
  }

  void reset() async {
    await _hiveService.resetAppSettings().then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );
  }

  void saveFirstLaunch() {
    _hiveService.saveFirstLaunch().then(
          (either) => either.fold(
            (l) => null,
            (r) => state = r,
          ),
        );
  }
}
