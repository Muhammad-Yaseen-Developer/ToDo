// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:myapp/text_widget.dart';
import 'package:myapp/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();

  void onChanged(int index) {
    setState(() {
      notes[index][1] = !notes[index][1];
    });
  }

  addbutton() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 200,
              width: 200,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: 'Enter Note',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            notes.add([_controller.text.toString(), false]);
                            _controller.clear();
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.cyan,
                          ),
                          height: 50,
                          width: 100,
                          child: Center(
                            child: Text(
                              'ADD',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.cyan,
                          ),
                          height: 50,
                          width: 100,
                          child: Center(
                            child: Text(
                              'BACK',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  List notes = [
    ['hey', false],
    ['hello', false],
    ['hi', false],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              addbutton();
            },
            backgroundColor: Colors.cyan,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            title: Center(
              child: Text(
                'ToDo',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  value: notes[index][1],
                  onChanged: (p0) {
                    onChanged(index);
                  },
                  text: notes[index][0],
                );
              })),
    );
  }
}
