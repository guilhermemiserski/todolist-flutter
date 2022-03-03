import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listaAtividades = [];
  final myController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text('To-do list'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'O valor não pode estar vazio';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Adicione uma tarefa'),
                controller: myController,
              ),
            ),
          ),
          _buildListView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: _addList,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: listaAtividades.length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: IconButton(
              color: Colors.redAccent,
              splashRadius: 20,
              icon: const Icon(
                Icons.delete,
              ),
              onPressed: () {
                setState(() {
                  listaAtividades.remove(listaAtividades[index]);
                });
              },
            ),
            title: Text(
              listaAtividades[index],
            ),
          );
        },
      ),
    );
  }

  _addList() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        listaAtividades.add(myController.text);
        myController.clear();
      });
    }
  }
}
