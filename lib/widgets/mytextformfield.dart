import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved, change;
  final Function()? obscure;
  final bool isNumber, enable, isObsure;
  final int? maxlines;
  final int? number;
  final Size size;
  final IconData? icon;
  final Color? txtcolor;
  final Color bgcolor;
  final TextEditingController? controller;

  const MyTextFormField({
    Key? key,
    this.maxlines,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.onSaved,
    this.number,
    required this.bgcolor,
    this.icon,
    this.txtcolor,
    required this.size,
    this.isNumber = false,
    this.enable = true,
    this.isObsure = false,
    this.obscure,
    this.controller,
    this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              labelText,
              style: FontStyles()
                  .h3()
                  .copyWith(color: black, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            enabled: enable,
            controller: controller,
            onChanged: change,
            style: FontStyles().h3().copyWith(
                  color: black,
                  fontWeight: FontWeight.bold,
                  //letterSpacing: 4,
                ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: FontStyles().h4().copyWith(
                    color: black.withOpacity(
                      .2,
                    ),
                  ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: blue,
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: blue,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: red,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: ash,
                  width: 1,
                ),
              ),
              filled: true,
              fillColor: bgcolor,
              prefixIcon: Icon(
                icon,
              ),
              suffix: obscure != null
                  ? GestureDetector(
                      onTap: obscure,
                      child: Icon(
                        isObsure ? Icons.visibility : Icons.visibility_off,
                        size: 20,
                      ),
                    )
                  : null,
            ),
            obscureText: isObsure,
            obscuringCharacter: '*',
            validator: validator,
            onSaved: onSaved,
            keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
            inputFormatters: isNumber
                ? <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(number),
                    FilteringTextInputFormatter.singleLineFormatter,
                  ]
                : null,
            maxLines: maxlines,
          ),
        ],
      ),
    );
  }
}
