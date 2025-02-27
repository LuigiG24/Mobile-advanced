import 'package:flutter/material.dart';
import 'package:todo_app/consts/colors.dart';
import 'package:todo_app/consts/sizes.dart';
import 'package:todo_app/data/firestore_data.dart';
import 'package:todo_app/data/task_model.dart';
import 'package:todo_app/widgets/form.dart';

class EditItemPage extends StatefulWidget {
  Task _task;
  EditItemPage(this._task, {super.key});

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  TextEditingController? title;
  TextEditingController? subtitle;

  final FocusNode titleFocusNode = FocusNode();
  final FocusNode subtitleFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget._task.title);
    subtitle = TextEditingController(text: widget._task.subtitle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleWidget("title", title!, titleFocusNode),
            size10,
            subtitleWidget("subtitle", subtitle!, subtitleFocusNode),
            size10,
            Padding(
              padding: symmetric15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Edit task",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: focusedColor,
                        minimumSize: Size(100, 50)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FirestoreDataSource().updateTask(widget._task.id, widget._task.title, widget._task.subtitle);
                    },
                    child: Text("Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: focusedColor,
                        minimumSize: Size(100, 50)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
