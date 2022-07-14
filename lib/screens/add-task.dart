import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_review/models/Database.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    late String newTextInput;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'اضافه کردن تسک جدید',
                  style: TextStyle(fontFamily: 'IranYekan', fontSize: 25.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            blurRadius: 2.0)
                      ]),
                  child: TextField(
                    autofocus: true,
                    style: const TextStyle(fontFamily: 'IranSans', fontSize: 20.0),
                    textAlign: TextAlign.right,
                    cursorHeight: 35.0,
                    decoration: const InputDecoration(
                        hintText: 'تسک جدید ...',
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                        )),
                    onChanged: (newText) {
                      newTextInput = newText;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.shade100,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextButton(
                          onPressed: () {
                            Provider.of<Database>(context, listen: false).addTask(newTextInput);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'اضافه شود',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'IranYekan',
                                color: Colors.white),
                          ))),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}