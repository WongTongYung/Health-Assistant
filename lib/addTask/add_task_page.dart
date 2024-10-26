import 'package:app/addTask/database_sevice.dart';
import 'package:app/addTask/task.dart';
import 'package:app/bar/top_bar.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _HomePageState();
}

class _HomePageState extends State<AddTaskPage> {
  //access to the database service
  final DatabaseService _databaseService = DatabaseService.instance;

  String? _task;

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: TopBar(),
      floatingActionButton: _addTaskButton(),
      body: _tasksList(),
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Add Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _task = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Add you task here...',
                  ),
                ),
                MaterialButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    if (_task == null || _task == "") return;
                    _databaseService.addTask(_task!);
                    setState(() {
                      _task = null;
                    });
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }

  //its a body of the home page
  //To display the data retreive from the database

  Widget _tasksList() {
    return FutureBuilder(
      //to retreive the data
      future: _databaseService.getTasks(),
      //to build a list form a body
      builder: (context, snapshot) {
        return Column(
          children: [
            // Text task list at the top
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Task List',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  //import data from task flie
                  Task task = snapshot.data![index];
                  return ListTile(
                    onLongPress: () {
                      //delete the task
                      _databaseService.deleteTask(
                        task.id,
                      );
                      setState(() {});
                    },
                    //This is return data to the content
                    title: Text(
                      task.content,
                      style: TextStyle(
                        fontSize: 22.0, // Adjust the font size as needed
                      ),
                    ),
                    trailing: Checkbox(
                      value: task.status == 1,
                      onChanged: (value) {
                        _databaseService.updateTaskStatus(
                          task.id,
                          value == true ? 1 : 0,
                        );
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
