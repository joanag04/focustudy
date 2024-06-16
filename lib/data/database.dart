import 'package:hive/hive.dart';
import 'package:teste_flutter/utils/todo.dart';

class ToDoDataBase {
  List<ToDo> toDoList = [];

  // reference the hive box
  final _myBox = Hive.box('mybox');

  // run this method if this is 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ToDo(taskName: 'Estudar Engenharia de Software', taskCompleted: false),
      ToDo(taskName: 'Trabalho prático 4', taskCompleted: false),
    ];
  }

  // load the data from de database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
