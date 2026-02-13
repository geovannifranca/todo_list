import 'package:flutter/material.dart';
import 'package:todo_list/models/task.model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> tasksList = [
    Task(title: 'Reunião 1', description: 'Começa as 16h', isFavorite: true),
    Task(title: 'Reunião 2', description: 'Começa as 17h'),
    Task(title: 'Reunião 3', isFavorite: true),
  ];

  final TextEditingController title = TextEditingController();
  final TextEditingController? subTitle = TextEditingController();
  bool favorite = false;

  void update() {
    setState(() {});
  }

  void addTask() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        bool description = false;
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Adicionar Tarefa',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      IconButton(
                        onPressed: () => setState(() {
                          Navigator.pop(context);
                        }),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey.shade600),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: TextFormField(
                      controller: title,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(0),
                        hint: Text(
                          'O que você gostaria de fazer?',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (description)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.8),
                      child: TextFormField(
                        controller: subTitle,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.all(0),
                          hintText: 'Adicionae informações',
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.notes),
                            onPressed: () {
                              setState(() {
                                description = !description;
                              });
                            },
                          ),
                          const SizedBox(width: 18.0),
                          IconButton(
                            icon: favorite
                                ? const Icon(Icons.star)
                                : const Icon(Icons.star_border_outlined),
                            onPressed: () {
                              setState(() {
                                favorite = !favorite;
                              });
                            },
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            tasksList.add(
                              Task(
                                title: title.text,
                                description: subTitle?.text,
                                isFavorite: favorite,
                              ),
                            );
                            title.text = '';
                            subTitle?.text = '';
                            favorite = false;
                            Navigator.pop(context);
                          });
                          update();
                        },
                        child: const Text('Adicionar'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
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
        child: ListView.separated(
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
                onTap: () {},
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
                    (task.description == null || task.description!.isEmpty)
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
