import 'package:flutter/material.dart';
import 'package:registration_test/config/themes/theme_colors.dart';
import 'package:registration_test/config/themes/theme_text_style.dart';

class FavScreenWidget extends StatelessWidget {
  const FavScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "Favorities",
            style: ThemeTextManropeBold.cmSize.copyWith(
              color: ThemeColors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
