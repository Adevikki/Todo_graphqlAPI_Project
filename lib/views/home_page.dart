import 'package:flutter/material.dart';
import 'package:flutter_todo_app_test/model/todo_model.dart';
import 'package:flutter_todo_app_test/shared/list_tiles.dart';
import 'package:flutter_todo_app_test/view_models/todo_viewmodel.dart';
import 'package:flutter_todo_app_test/route.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoHomeViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff742DDD),
            title: const Text(
              'Todo List',
              style: TextStyle(
                color: Color(0xffFFFFFF),
              ),
            ),
          ),
          body: viewModel.taskCount == 0
              ? const EmptyTodo()
              : ListView.builder(
                  itemCount: viewModel.taskCount,
                  itemBuilder: (context, index) {
                    final task = viewModel.tasksList[index];
                    return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CustomListTile(
                          index: index,
                          onPressed: () {
                            viewModel.navigateToEditTask(context, task);
                          },
                          subtitle: task.description,
                          title: task.title,
                          onCheckboxClicked: (val) {
                            // viewModel.updateTask(context, task, val!);
                            setState(
                              () {
                                task.isCompleted = val!;
                              },
                            );
                          },
                          isCompleted: task.isCompleted,
                        ));
                  }),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xff742DDD),
            child: const Icon(
              Icons.add,
              color: Color(0xffFFFFFF),
            ),
            onPressed: () {
              viewModel.navigateToCreateTask(context);
            },
          ),
          bottomNavigationBar: Container(
              child: IconButton(
                  onPressed: () {
                    // viewModel.createTasks();
                    viewModel.getTasks();
                  },
                  icon: const Icon(Icons.access_alarm))),
        );
      },
    );
  }
}

class EmptyTodo extends StatelessWidget {
  const EmptyTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 300),
      child: Center(
        child: Column(
          children: const [
            Text(
              'Todo List is empty',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Create a task')
          ],
        ),
      ),
    );
  }
}
