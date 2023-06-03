import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import 'mybutton.dart';


dialogPopUp(
  BuildContext context,
  String title,
  String message,
  String btnText,
  Color btnColor,
  Function() quit,
  int success,
) {
  Size size = MediaQuery.of(context).size;
  return showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: btnColor.withOpacity(.4),
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionDuration: const Duration(
      milliseconds: 150,
    ),
    transitionBuilder: (ctx, a1, a2, child) {
      return Transform.scale(
        scale: a1.value,
        origin: const Offset(10, 10),
        child: AlertDialog(
          backgroundColor: white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            title,
            style: FontStyles().h3().copyWith(
                  color: black,
                  fontWeight: FontWeight.w900,
                ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              success == 0
                  ? const SizedBox()
                  : success == 1
                      ? Image.asset(
                          'assets/images/sucess.gif',
                          width: size.width * .4,
                        )
                      : Image.asset(
                          'assets/images/error.gif',
                          width: size.width * .4,
                        ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: FontStyles().h4().copyWith(
                      color: black,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actionsOverflowAlignment: OverflowBarAlignment.center,
          actions: <Widget>[
            btnText == ""
                ? MyButtonRegular(
                    title: "close",
                    textcolor: black,
                    color: red,
                    size: btnText == "" ? size : size * .5,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                : MyButtonRegular(
                    title: btnText,
                    color: btnColor,
                    textcolor: white,
                    size: size * .5,
                    onTap: quit,
                  ),
          ],
        ),
      );
    },
  );
}
