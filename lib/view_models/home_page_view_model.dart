
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_test/model/todo_model.dart';
import 'package:flutter_todo_app_test/service/navigation_services.dart';
import 'package:flutter_todo_app_test/todo_screens/create_task_page.dart';
import 'package:flutter_todo_app_test/todo_screens/provider/todo_edit_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';






class HomePageViewModel extends ChangeNotifier {
  List<NewTask>? tasksList;

  bool isLoading = false;

  int get taskCount {
    return tasksList!.length;
  }

  
  void navigateToCreateTask(BuildContext context) {
    Provider.of<NavigationService>(context, listen: false).to(
      MaterialPageRoute(
        builder: (context) => const CreateTaskPage(),
      ),
    );
  }

  void navigateToEditTask(BuildContext context, NewTask task) {
    Provider.of<NavigationService>(context, listen: false).to(
      MaterialPageRoute(
        builder: (context) => TodoEditPage(
          task: task,
        ),
      ),
    );
  }

  static String formatDate(DateTime date) {
    return DateFormat.yMMMEd('en_US').format(date);
  }



}