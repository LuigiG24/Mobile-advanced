import 'package:flutter/material.dart';
import 'package:todo_app/consts/colors.dart';
import 'package:todo_app/widgets/task_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        backgroundColor: focusedColor,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TaskWidget();
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
