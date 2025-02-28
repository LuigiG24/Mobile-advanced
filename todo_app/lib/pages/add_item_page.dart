import 'package:flutter/material.dart';
import 'package:todo_app/consts/colors.dart';
import 'package:todo_app/consts/sizes.dart';
import 'package:todo_app/data/firestore_data.dart';
import 'package:todo_app/widgets/form.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final title = TextEditingController();
  final subtitle = TextEditingController();

  final FocusNode titleFocusNode = FocusNode();
  final FocusNode subtitleFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            titleWidget("title", title, titleFocusNode),
            size10,
            subtitleWidget("subtitle", subtitle, subtitleFocusNode),
            size10,
            Padding(
              padding: symmetric15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      FirestoreDataSource().addTask(title.text, subtitle.text);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: focusedColor,
                        minimumSize: const Size(100, 50)),
                    child: const Text("Add task",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: focusedColor,
                        minimumSize: const Size(100, 50)),
                    child: const Text("Cancel",
                        style:  TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
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
