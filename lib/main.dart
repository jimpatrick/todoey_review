import 'package:flutter/material.dart';
import 'package:todoey_review/screens/add-task.dart';
import 'package:todoey_review/models/Database.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Database>(
      create: (context) => Database(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color(0xFF60caec)),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addTask() {
    setState(() {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => const AddTask(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    int tasksNumber = Provider.of<Database>(context).tasks.length;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 90.0,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40.0,
                  child: Icon(
                    Icons.list,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'تسک روزانه',
                  style: TextStyle(
                      fontFamily: 'IranYekan',
                      fontSize: 30.0,
                      color: Colors.white),
                ),
                Text(
                  '$tasksNumber وظیفه',
                  style: const TextStyle(
                    fontFamily: 'IranYekan',
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                  )),
              child: Consumer<Database>(
                builder: (BuildContext context, value, Widget? child) {
                  return ListView.builder(
                    itemBuilder: (context, index) => Directionality(
                      textDirection: TextDirection.rtl,
                      child: CheckboxListTile(
                        value: value.tasks[index].isDone,

                        onChanged: (value) {
                          setState(() {
                            Provider.of<Database>(context, listen: false)
                                .tasks[index]
                                .changeIsDone(value);
                          });
                        },
                        contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                        title: GestureDetector(
                          onLongPress: () {
                            Provider.of<Database>(context, listen: false).deleteTask(index);
                          },
                          child: Text(
                            value.tasks[index].title,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'IranSans',
                                decoration:
                                value.tasks[index].isDone!
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          ),
                        ),
                      ),
                    ),
                    itemCount: value.tasks.length,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
