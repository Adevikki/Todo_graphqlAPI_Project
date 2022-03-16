import 'package:flutter/material.dart';
import 'package:flutter_todo_app_test/shared/colors.dart';
import 'package:flutter_todo_app_test/shared/utilities/screen_util.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final Color color;

  final Color labelColor;
  final bool isLoading;
  final bool isActive;

  const CustomElevatedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.color = AppColors.primaryColor,
    this.labelColor = AppColors.white,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: Size(
          ScreenUtil.screenWidth(context),
          50,
        ),
        onSurface: AppColors.black,
        primary: isLoading ? AppColors.darkTextColor : color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: isActive ? (isLoading ? null : onPressed) : null,
      child: Text(
        isLoading ? 'Loading...' : label,
      ),
    );
  }
}