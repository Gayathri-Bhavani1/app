import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

class MyButtonRegular extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Color color;
  final Color? textcolor;
  final Color splashcolor;
  final Size size;
  final bool isIcon;
  final IconData icon;
  const MyButtonRegular({
    Key? key,
    required this.onTap,
    required this.title,
    required this.color,
    this.textcolor,
    required this.size,
    this.splashcolor = black,
    this.isIcon = false,
    this.icon = Icons.add,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      elevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(05),
      ),
      minWidth: size.width * 0.6,
      splashColor: splashcolor.withAlpha(50),
      clipBehavior: Clip.antiAlias,
      color: color,
      child: isIcon
          ? Icon(
              icon,
              color: textcolor,
            )
          : Text(
              title,
              style: FontStyles().h3().copyWith(
                    color: textcolor ?? white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
            ),
    );
  }
}
