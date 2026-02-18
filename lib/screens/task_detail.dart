import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/task.model.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key, required this.task});
  final Task task;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  late bool isfavorite;

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    isfavorite = widget.task.isFavorite;
    title.text = widget.task.title;
    description.text = widget.task.description ?? "";
    super.initState();
  }

  void saveTask() {
    if (!formkey.currentState!.validate()) return;
    final updatedTask = widget.task;
    updatedTask.isFavorite = isfavorite;
    updatedTask.title = title.text;
    updatedTask.description = description.text.isEmpty
        ? null
        : description.text;

    Navigator.of(context).pop(updatedTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => setState(() {
              isfavorite = !isfavorite;
            }),
            icon: Icon(isfavorite ? Icons.star : Icons.star_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(12.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: title,
                  decoration: const InputDecoration(labelText: "Título"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo Obrigatório";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: description,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Descrição",
                  ),
                  maxLines: 5,
                ),
                const SizedBox(height: 26.0),
                TextButton(
                  onPressed: saveTask,
                  child: const Text('Salvar tarefa'),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Criado ${DateFormat.MMMEd("pt_BR").format(widget.task.createdAt)}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop("remover");
                      },
                      icon: const Icon(Icons.delete_outline, size: 34),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
