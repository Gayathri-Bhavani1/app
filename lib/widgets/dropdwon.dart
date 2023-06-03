import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

class MyDropDown extends StatelessWidget {
  final List<DropdownMenuItem> itemsList;
  final String? lableText, hintText, value;
  final Function(dynamic)? selection;
  final Function(dynamic)? onSaved;
  final String? Function(dynamic)? validator;
  final Size size;
  final Color? bcolor;
  const MyDropDown({
    Key? key,
    this.bcolor,
    required this.itemsList,
    required this.size,
    required this.lableText,
    required this.hintText,
    this.selection,
    this.value,
    this.onSaved,
    this.validator,
    required String labelText,
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
            padding: const EdgeInsets.only(
              left: 05,
            ),
            child: Text(
              lableText!,
              style: FontStyles().h3().copyWith(
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField(
            value: value,
            hint: Text(
              hintText!,
              style: FontStyles().h3().copyWith(
                    color: black.withOpacity(.3),
                  ),
            ),
            icon: const Icon(
              Icons.arrow_drop_down_circle_rounded,
            ),
            iconEnabledColor: blue,
            iconDisabledColor: grey,
            iconSize: 30,
            elevation: 16,
            isExpanded: true,
            dropdownColor: white,
            borderRadius: BorderRadius.circular(
              10,
            ),
            decoration: InputDecoration(
              fillColor: white,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: bcolor ?? ash,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: bcolor ?? ash,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: bcolor ?? ash,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              errorStyle: FontStyles().h4().copyWith(
                    color: red,
                  ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
            ),
            onChanged: selection,
            isDense: true,
            onSaved: onSaved,
            validator: validator,
            items: itemsList,
          ),
        ],
      ),
    );
  }
}
