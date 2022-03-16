import 'package:flutter/material.dart';
import 'package:flutter_todo_app_test/shared/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.textEditingController,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.name,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.initialValue,
  }) : super(key: key);

  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final TextEditingController textEditingController;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final Widget? suffix;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        TextFormField(
          controller: textEditingController,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          maxLines: maxLines,
          // cursorColor: AppColors.darkTextColor,
          initialValue: initialValue,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          keyboardType: keyboardType,
          style: textTheme.bodyText2,
          decoration: InputDecoration(
            suffixIcon: suffix,
            hintText: hintText,
            hintStyle: textTheme.bodyText2!.copyWith(color: AppColors.grey),
            fillColor: AppColors.lightGrey,
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none,
            ),
            disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        
      ],
    );
  }
}