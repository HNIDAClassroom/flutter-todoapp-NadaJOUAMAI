import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});
  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  // ignore: unused_field
  var _enteredTitle = '';

  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }

  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
     void _submitTaskData() {
    
    if (_titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text(
              'Merci de saisir le titre de la tâche à ajouter dans la liste'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
   }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Task title'),
            ),
          ),

          Row(
            children: [
 	            ElevatedButton(
                   onPressed: _submitTaskData,
                   style: ElevatedButton.styleFrom(
                   primary: Colors.black, 
                   onPrimary: Colors.white, 
               ),
  child: const Text('Enregistrer'),
),
            ],
          ),
        ],
      ),
    );
  }
}
