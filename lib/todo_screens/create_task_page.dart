import 'package:flutter/material.dart';
import 'package:flutter_todo_app_test/main.dart';
import 'package:flutter_todo_app_test/model/todo_model.dart';
import 'package:flutter_todo_app_test/service/navigation_services.dart';
import 'package:flutter_todo_app_test/shared/colors.dart';
import 'package:flutter_todo_app_test/shared/elevated_button.dart';
import 'package:flutter_todo_app_test/shared/textform_field.dart';

import 'package:flutter_todo_app_test/view_models/todo_viewmodel.dart';
import 'package:flutter_todo_app_test/views/home_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// class CreateTaskPage extends StatefulWidget {
//   const CreateTaskPage({Key? key, task}) : super(key: key);

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  bool isTitleEmpty = true;
  bool isDescriptionEmpty = true;

  @override
  void initState() {
    super.initState();

    titleController.addListener(() {
      isTitleEmpty = titleController.text.isEmpty;
    });

    descriptionController.addListener(() {
      isDescriptionEmpty = descriptionController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          'Create Task',
          style: textTheme.headline5!.copyWith(color: AppColors.white),
        ),
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
              onChanged: (value) {
                setState(() {});
              },
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
              hintText: 'Describe your Task',
              maxLines: 8,
              onChanged: (value) {
                setState(() {});
              },
              textEditingController: descriptionController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              isActive: isDescriptionEmpty || isTitleEmpty ? false : true,
              label: 'Save',
              onPressed: () {
                final NewTask newTask = NewTask(
                    id: '${DateTime.now().millisecondsSinceEpoch}',
                    developerId: 'Ade_vikki',
                    description: descriptionController.text,
                    createdAt:
                        DateFormat.yMMMEd('en_US').format(DateTime.now()),
                    isCompleted: false,
                    title: titleController.text,
                    updatedAt:
                        DateFormat.yMMMEd('en_US').format(DateTime.now()));

                isDescriptionEmpty || isTitleEmpty
                    ? null
                    : Provider.of<TodoHomeViewModel>(context, listen: false)
                        .addTask(newTask);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const TodoHome()));
              },
            )
          ],
        ),
      ),
    );
  }
}
