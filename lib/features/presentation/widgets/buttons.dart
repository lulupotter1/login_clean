import 'package:flutter/cupertino.dart';
import 'package:registration_test/config/themes/theme_colors.dart';
import 'package:registration_test/config/themes/theme_text_style.dart';

class CommonCupertinoButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;
  const CommonCupertinoButton({
    super.key,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 64,
      // padding: EdgeInsets.symmetric(vertical: 20),
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(6),
      color: ThemeColors.blue,
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: ThemeTextManropeBold.cmSize.copyWith(
          color: ThemeColors.white,
          height: 1.5,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
