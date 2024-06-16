import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoMain extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoMain({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 230, 101, 92),
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 121, 169, 191),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              // task name
              Text(taskName,
                  style: TextStyle(
                      color: Colors.white,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
            ],
          ),
        ),
      ),
    );
  }
}
