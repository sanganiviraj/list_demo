import 'package:flutter/material.dart';
import 'package:todolist/todo.dart';

class todo_item extends StatelessWidget {
  final Todo Todos_items;

  final todochange;
  final tododeleteitem;


  const todo_item({Key? key, required this.Todos_items,required this.todochange,required this.tododeleteitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
          onTap: () {
            todochange(Todos_items);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.white,
          leading: Icon(
            Todos_items.pass ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.blueAccent,
          ),
          title: Text(
            Todos_items.todotext!,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                decoration:
                    Todos_items.pass ? TextDecoration.lineThrough : null),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Colors.redAccent,
            ),
            child: IconButton(
              onPressed: () {
                tododeleteitem(Todos_items.id);
              },
              icon: Icon(Icons.delete),
              iconSize: 18,
              color: Colors.white,
            ),
          )),
    );
  }
}
