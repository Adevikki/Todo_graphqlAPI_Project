import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app_test/model/todo_model.dart';
import 'package:flutter_todo_app_test/service/api.dart';
import 'package:flutter_todo_app_test/service/navigation_services.dart';
import 'package:flutter_todo_app_test/todo_screens/create_task_page.dart';
import 'package:flutter_todo_app_test/todo_screens/provider/todo_edit_page.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TodoHomeViewModel extends ChangeNotifier {
  final api = Network(dio: Dio());
  List<NewTask> tasksList = [
    NewTask(
        id: '${DateTime.now().millisecondsSinceEpoch}',
        developerId: 'Ade_vikki',
        description: 'Day1 cruise',
        createdAt: 'formatDate(DateTime.now()),',
        isCompleted: true,
        title: 'Task1',
        updatedAt: DateFormat.yMMMEd('en_US').format(DateTime.now())),
    NewTask(
        id: '${DateTime.now().millisecondsSinceEpoch}',
        developerId: 'Ade_vikki',
        description: 'Day2 cruise',
        createdAt: DateFormat.yMMMEd('en_US').format(DateTime.now()),
        isCompleted: true,
        title: 'Task2',
        updatedAt: DateFormat.yMMMEd('en_US').format(DateTime.now())),
    NewTask(
        id: '${DateTime.now().millisecondsSinceEpoch}',
        developerId: 'Ade_vikki',
        description: 'Day3 cruise',
        createdAt: DateFormat.yMMMEd('en_US').format(DateTime.now()),
        isCompleted: true,
        title: 'Task3',
        updatedAt: DateFormat.yMMMEd('en_US').format(DateTime.now())),
    NewTask(
        id: '${DateTime.now().millisecondsSinceEpoch}',
        developerId: 'Ade_vikki',
        description: 'Day4 cruise',
        createdAt: DateFormat.yMMMEd('en_US').format(DateTime.now()),
        isCompleted: true,
        title: 'Task4',
        updatedAt: DateFormat.yMMMEd('en_US').format(DateTime.now())),
  ];

  Future<void> getTasks() async {
    try {
      final apiData = await api.get();
      if (apiData!.statusCode == 200) {
        List listData = apiData.data;
        tasksList = listData.map((e) => NewTask.fromMap(e)).toList();
        print('succeful');
      } else if (apiData.statusCode != 200) {
        print('An error occur');
      }
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> createTasks() async {
    try {
      final apiData = await api.post(data: {
        "title": "First task",
        "description": "first description",
        "developer_id": "id-vikki",
      });
      if (apiData!.statusCode == 200) {
        print('succeful');
      } else if (apiData.statusCode != 200) {
        print('An error occur');
      }
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }

  int get taskCount {
    return tasksList.length;
  }
  // List<NewTask>? tasksList;

  // bool isLoading = false;

  // int get taskCount {
  //   return tasksList!.length;
  // }

  void _reArrangeList() {
    List<NewTask> firstListOfTasks = [];
    List<NewTask> secondListOfTasks = [];
    for (NewTask i in tasksList) {
      if (i.isCompleted == true) {
        secondListOfTasks.add(i);
      } else {
        firstListOfTasks.add(i);
      }
    }

    firstListOfTasks.addAll(secondListOfTasks);
    tasksList = firstListOfTasks;
    // isLoading = false;
    notifyListeners();
  }

  void addTask(NewTask task) {
    tasksList.add(task);
    notifyListeners();
  }

  void deleteItem(context, NewTask task) {
    tasksList.remove(task);
    notifyListeners();
  }

  void editTask(
      NewTask newtask, String title, String description, String text) {
    newtask.copyWith(
      title: "page",
      description: "description",
    );

    notifyListeners();
  }

  void navigateToCreateTask(BuildContext context) {
    Provider.of<NavigationService>(context, listen: false).to(
      MaterialPageRoute(
        builder: (context) => const CreateTaskPage(),
      ),
    );
  }

  navigateToEditTask(BuildContext context, NewTask newtask) {
    Provider.of<NavigationService>(context, listen: false).to(
      MaterialPageRoute(
        builder: (context) => TodoEditPage(
          task: newtask,
        ),
      ),
    );
  }
}
