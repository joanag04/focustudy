import 'package:flutter/material.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  _DisciplinasPageState createState() => _DisciplinasPageState();
}

class _DisciplinasPageState extends State<SubjectsPage> {
  List<Map<String, dynamic>> disciplinas = [];

  void _addDisciplina() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController disciplinaController = TextEditingController();
        return AlertDialog(
          title: const Text(
            'Adicionar Nova Disciplina',
            style: TextStyle(color: Color.fromARGB(255, 121, 169, 191)),
          ),
          content: TextField(
            controller: disciplinaController,
            decoration: const InputDecoration(hintText: 'Nome da Disciplina'),
          ),
          //  lista de elementos da classe widget que têm ações
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Color.fromARGB(255, 46, 49, 50)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Adicionar',
                style: TextStyle(color: Color.fromARGB(255, 121, 169, 191)),
              ),
              onPressed: () {
                setState(() {
                  disciplinas.add({
                    'nome': disciplinaController.text,
                    'topicos': [],
                  });
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addTopico(int disciplinaIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController topicoController = TextEditingController();
        return AlertDialog(
          title: const Text(
            'Adicionar Novo Tópico/Meta',
            style: TextStyle(color: Color.fromARGB(255, 121, 169, 191)),
          ),
          content: TextField(
            controller: topicoController,
            decoration: InputDecoration(hintText: 'Nome do Tópico/Meta'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancelar',
                style:
                    TextStyle(color: const Color.fromARGB(255, 121, 169, 191)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Adicionar',
                style: TextStyle(color: Color.fromARGB(255, 121, 169, 191)),
              ),
              onPressed: () {
                setState(() {
                  disciplinas[disciplinaIndex]['topicos']
                      .add(topicoController.text);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Disciplinas e Tópicos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 121, 169, 191),
      ),
      body: ListView.builder(
        itemCount: disciplinas.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              disciplinas[index]['nome'],
              style: const TextStyle(color: Color.fromARGB(255, 121, 169, 191)),
            ),
            children: <Widget>[
              ...disciplinas[index]['topicos'].map<Widget>((topico) {
                return ListTile(
                  title: Text(
                    topico,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 152, 184, 199)),
                  ),
                );
              }).toList(),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Adicionar Tópico'),
                onTap: () {
                  _addTopico(index);
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDisciplina,
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 121, 169, 191),
      ),
    );
  }
}
