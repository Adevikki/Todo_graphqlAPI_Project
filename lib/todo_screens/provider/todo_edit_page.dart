import 'package:flutter_todo_app_test/model/todo_model.dart';

import 'package:flutter_todo_app_test/service/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app_test/shared/elevated_button.dart';
import 'package:flutter_todo_app_test/shared/textform_field.dart';
import 'package:flutter_todo_app_test/view_models/todo_viewmodel.dart';

import 'package:provider/provider.dart';

class TodoEditPage extends HookWidget {
  const TodoEditPage({
    Key? key,
    required this.task,
  }) : super(key: key);
  final NewTask task;

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController(text: task.title);
    final descriptionController =
        useTextEditingController(text: task.description);

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff742DDD),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace),
          onPressed: () {
            Provider.of<NavigationService>(context, listen: false).back();
          },
        ),
        title: Text(
          'Add Task',
          style: textTheme.headline5!.copyWith(color: const Color(0xffFFFFFF)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<TodoHomeViewModel>(context, listen: false)
                    .deleteItem(context, task);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: textTheme.bodyText2,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              hintText: 'What do you want?',
              onChanged: (value) {},
              textEditingController: titleController,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Description',
              style: textTheme.bodyText2,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              hintText: 'Describe your task',
              maxLines: 8,
              onChanged: (value) {},
              textEditingController: descriptionController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomElevatedButton(
              label: 'Save',
              onPressed: () {
                print(titleController.text);

                Provider.of<TodoHomeViewModel>(context, listen: false).editTask(
                    task, task.title, task.description, titleController.text);
               

                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
