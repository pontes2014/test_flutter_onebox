import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_onebox/presentation/screens/login_screen.dart';
import 'package:test_flutter_onebox/presentation/state/auth_state.dart';
import 'package:test_flutter_onebox/presentation/state/task_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthState()),
        ChangeNotifierProvider(create: (context) => TaskState()..loadTasks()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Test Flutter OneBox',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
