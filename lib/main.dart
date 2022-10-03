import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "ToDo App",
      home: Skelet(),
    );
  }
}

class Skelet extends StatelessWidget {
  const Skelet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List for to do..."),
      ),
      body: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController t1 = TextEditingController();
  List toDo = [];
  insertElement() {
    setState(() {
      toDo.add(t1.text);
      t1.clear();
    });
  }

  removeElement() {
    setState(() {
      toDo.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
            child: ListView.builder(
          itemCount: toDo.length,
          itemBuilder: (context, indexNumber) => ListTile(
            subtitle: const Text("To Do Things"),
            title: Text(toDo[indexNumber]),
          ),
        )),
        TextField(
          controller: t1,
        ),
        ElevatedButton(
          onPressed: insertElement,
          child: const Text("Insert"),
        ),
        ElevatedButton(
          onPressed: removeElement,
          child: const Text("Remove"),
        ),
      ],
    );
  }
}
