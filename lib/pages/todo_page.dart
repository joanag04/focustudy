import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:teste_flutter/components/dialog_box.dart';
import 'package:teste_flutter/data/database.dart';
import 'package:teste_flutter/utils/todo.dart';
import '../components/todo_main.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever opening the app, then crate a default data
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  // text controller to acess information of a new task
  final _controller = TextEditingController();

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index].taskCompleted = value ?? false;
    });
    db.updateDataBase();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add(ToDo(taskName: _controller.text, taskCompleted: false));
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  //create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 121, 169, 191),
          title: const Text(
            'LISTA DE TAREFAS',
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 121, 169, 191),
          onPressed: createNewTask,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoMain(
                taskName: db.toDoList[index].taskName,
                taskCompleted: db.toDoList[index].taskCompleted,
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }
}
