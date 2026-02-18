import 'package:flutter/material.dart';
import 'package:todo_list/models/task.model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  bool isFavorite = false;
  bool showDescription = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void addTask() {
    if (!formKey.currentState!.validate()) return;
    final task = Task(
      title: titleController.text,
      description: descriptionController.text.isEmpty
          ? null
          : descriptionController.text,
      isFavorite: isFavorite,
    );
    titleController.text = '';
    descriptionController.text = '';

    Navigator.of(context).pop(task);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 20,
        top: 28,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Adicionar Tarefa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider(thickness: 1.0, color: Colors.black54),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
                hintText: 'O que você gostaria de fazer?',
                hintStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campo obrigatório";
                }
                return null;
              },
            ),
            if (showDescription)
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: InputBorder.none,
                  hintText: 'Adicionar informações',
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        showDescription = !showDescription;
                      }),
                      child: const Icon(Icons.sort),
                    ),
                    const SizedBox(width: 12.0),
                    GestureDetector(
                      onTap: () => setState(() {
                        isFavorite = !isFavorite;
                      }),
                      child: Icon(isFavorite ? Icons.star : Icons.star_outline),
                    ),
                  ],
                ),
                TextButton(onPressed: addTask, child: const Text('Adicionar')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
