import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:registration_test/config/router/app_router.dart';
import 'package:registration_test/config/themes/theme_colors.dart';
import 'package:registration_test/config/themes/theme_text_style.dart';
import 'package:registration_test/core/app/app_injection.dart';
import 'package:registration_test/features/domain/entities/login_entities.dart';

class ProfileScreenWidget extends StatelessWidget {
  final UserEntity userData;

  const ProfileScreenWidget({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        SvgPicture.asset(
          "assets/svg/profile_big.svg",
          width: 64,
          height: 64,
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            userData.nickname ?? "No nickname",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: ThemeTextManropeSemiBold.cmSize.copyWith(
              color: ThemeColors.black,
              fontSize: 24,
              height: 0.4,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            userData.email ?? "No email",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: ThemeTextManropeRegular.cmSize.copyWith(
              color: ThemeColors.textGrey,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 27),
        GestureDetector(
          onTap: () {
            secureDB.deleteAll();

            AutoRouter.of(context).popAndPush(const LoginRoute());
          },
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 23),
            color: ThemeColors.white,
            child: Text(
              "Выйти",
              style: ThemeTextManropeRegular.cmSize.copyWith(
                color: ThemeColors.textRed,
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}
