import 'package:flutter/material.dart';
import 'package:todo_app/consts/sizes.dart';
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
          children: [
            titleWidget("title", title, titleFocusNode),
            size10,
            subtitleWidget("subtitle", subtitle, subtitleFocusNode),
            size10,
          ],
        ),
      ),
    );
  }
}
