import 'package:flutter/material.dart';
import 'package:registration_test/config/themes/theme_colors.dart';
import 'package:registration_test/config/themes/theme_text_style.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appTitleText;
  final double appHeight;
  const CommonAppBar({
    super.key,
    required this.appTitleText,
    this.appHeight = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(appHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: ThemeColors.white,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Text(
          appTitleText,
          style: ThemeTextManropeMedium.cmSize.copyWith(
            color: ThemeColors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
