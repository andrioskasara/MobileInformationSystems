import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyCoursesScreen(),
    );
  }
}

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  final List<String> _courses = [];

  void addCourse() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newCourse = "";
          return AlertDialog(
            title: const Text("Add a new course"),
            content: TextField(
              onChanged: (value) {
                newCourse = value;
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (newCourse.isNotEmpty) {
                        _courses.add(newCourse);
                      }
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Add"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("201007"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: ListView.builder(
          itemCount: _courses.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  _courses[index],
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_rounded),
                  onPressed: () {
                    setState(() {
                      _courses.removeAt(index);
                    });
                  },
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: addCourse,
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}
