import 'package:flutter/material.dart';
import 'package:todo_app/consts/colors.dart';
import 'package:todo_app/data/firestore_data.dart';
import 'package:todo_app/data/task_model.dart';
import 'package:todo_app/pages/edit_item_page.dart';

class TaskWidget extends StatefulWidget {
  Task _task;
  TaskWidget(this._task, {super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

bool isDone = false;

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 2)),
            ],
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget._task.title,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Checkbox(value: widget._task.isDone, onChanged: (value){
                          setState(() {
                            widget._task.isDone = !widget._task.isDone;
                          });
                          FirestoreDataSource().isDone(widget._task.id, widget._task.isDone);
                        }),
                      ],
                    ),
                    Text(
                      widget._task.subtitle,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EditItemPage(widget._task)));
                      },
                      child: Container(
                        width: 90,
                        decoration: BoxDecoration(
                          color: focusedColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          child: Text(
                            "Edit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
