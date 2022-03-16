import 'package:flutter/material.dart';
import 'package:flutter_todo_app_test/shared/colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.index,
    this.isCompleted = false,
    this.onCheckboxClicked,
    required this.onPressed,
    required this.subtitle,
    required this.title,
  }) : super(key: key);

  final Function() onPressed;
  final String title;
  final String subtitle;
  final bool isCompleted;
  final int index;
  final Function(bool?)? onCheckboxClicked;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      onTap: onPressed,
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: isCompleted ? AppColors.green : AppColors.orange,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: isCompleted == false
              ? AppColors.lightOrange
              : AppColors.lightGreen,
          child: Text(
            isCompleted == false
                ? '${index + 1}'
                : title.substring(0, 1).toUpperCase(),
            style: textTheme.bodyText2!.copyWith(
              color: isCompleted == false ? AppColors.orange : AppColors.green,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        style: textTheme.bodyText2!.copyWith(
          decoration: isCompleted == false ? null : TextDecoration.lineThrough,
        ),
      ),
      subtitle: Text(
        subtitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: textTheme.bodyText1!.copyWith(
          color: AppColors.grey,
          decoration: isCompleted == false ? null : TextDecoration.lineThrough,
        ),
      ),
      trailing: Checkbox(
        onChanged: onCheckboxClicked,
        value: isCompleted,
      ),
    );
  }
}
