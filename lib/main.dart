import 'package:flutter/material.dart';
import 'package:flutter_todo_app_test/route.dart';
import 'package:flutter_todo_app_test/service/navigation_services.dart';
import 'package:flutter_todo_app_test/todo_screens/create_task_page.dart';
import 'package:flutter_todo_app_test/view_models/todo_viewmodel.dart';
import 'package:flutter_todo_app_test/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
        ChangeNotifierProvider(
          create: (_) => TodoHomeViewModel(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => CreateNewTaskViewModel(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => EditTaskViewModel(),
        // ),
        Provider(
          create: (_) => NavigationService(),
        ),
        // Provider(
        //   create: (_) => GraphQLService(),
        // ),
        // Provider(
        //   create: (_) => SnackBarService(),
        // ),
      ],
      builder: (context, _) => MaterialApp(
        title: 'Joovlin Assessment',
        debugShowCheckedModeBanner: false,
        // theme: AppTheme.themeData,
        home: const TodoHome(),
        navigatorKey: context.watch<NavigationService>().navigatorKey,
        // scaffoldMessengerKey:
        //     context.watch<SnackBarService>().scaffoldMessengerKey,
      ),
    );
  }
}
// routes: {
//         taskPageRoute: (context) => const AddTaskScreen(),
//       },
