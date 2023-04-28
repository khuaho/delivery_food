import 'package:flutter/material.dart';

import '../../global/gen/assets.gen.dart';
import '../../global/gen/fonts.gen.dart';
import '../../global/gen/i18n.dart';
import '../../global/themes/app_colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.of(context)!;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.coverBg.path),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.color,
                ),
              ),
            ),
          ),
          Column(
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
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                child: Column(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
