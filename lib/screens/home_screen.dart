import 'package:flutter/material.dart';
import 'package:todo_list/models/task.model.dart';
import 'package:todo_list/screens/task_detail.dart';
import 'package:todo_list/widgets/add_task.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> tasksList = [];

  final TextEditingController title = TextEditingController();
  final TextEditingController? subTitle = TextEditingController();
  bool favorite = false;

  void addTask() async {
    final Task? newTask = await showModalBottomSheet<Task>(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return const AddTask();
      },
    );
    if (newTask != null) {
      setState(() {
        tasksList.add(newTask);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tarefas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: tasksList.isEmpty
            ? const Center(child: Text("Adicione uma tarefa"))
            : ListView.separated(
                itemCount: tasksList.length,
                separatorBuilder: (_, _) => const SizedBox(height: 4.0),
                itemBuilder: (_, int index) {
                  Task task = tasksList[index];
                  return Card(
                    elevation: 2.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.indigo[50],
                    child: ListTile(
                      onTap: () async {
                        final resultUpdated = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TaskDetail(task: task),
                          ),
                        );
                        if (resultUpdated != null) {
                          setState(() {
                            if (resultUpdated is Task) {
                              task = resultUpdated;
                            } else {
                              tasksList.remove(task);
                            }
                          });
                        }
                      },
                      leading: Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          setState(() {
                            task.isCompleted = value!;
                          });
                        },
                      ),
                      title: Text(task.title),
                      subtitle:
                          (task.description == null ||
                              task.description!.isEmpty)
                          ? null
                          : Text(task.description!),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            task.isFavorite = !task.isFavorite;
                          });
                        },
                        icon: task.isFavorite
                            ? const Icon(Icons.star, color: Colors.indigo)
                            : const Icon(
                                Icons.star_border_outlined,
                                color: Colors.indigo,
                              ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => addTask(),
        label: const Text('Nova Tarefa'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
