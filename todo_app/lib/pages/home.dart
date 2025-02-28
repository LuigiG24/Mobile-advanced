import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/consts/colors.dart';
import 'package:todo_app/data/firestore_data.dart';
import 'package:todo_app/pages/add_item_page.dart';
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
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddItemPage()));
        },
        backgroundColor: focusedColor,
        child: const  Icon(Icons.add),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirestoreDataSource().stream(),
            builder: (context, snapshot) {
              final tasklist = FirestoreDataSource().getTask(snapshot);
              return ListView.builder(
                itemBuilder: (context, index) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }

                  final task = tasklist[index];
                  return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        FirestoreDataSource().deleteTask(task.id);
                      },
                      child: TaskWidget(task));
                },
                
                itemCount: tasklist.length,
              );
            }),
      ),
    );
  }
}
