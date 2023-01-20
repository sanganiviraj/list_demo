import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/todo.dart';
import 'package:todolist/todo_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final todos_list=Todo.todolist();
  TextEditingController todocontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color(0XFFecedf4)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0XFFecedf4),
        appBar: _buildAppBar(),
        body: Stack(
          children: [ Container(
            padding: EdgeInsets.symmetric(horizontal:  20,vertical: 15),
            child: (
            Column(children: [
                searchbox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50,bottom: 20),
                      child: Text('All Todo',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                    ),
                    for (Todo todo in todos_list)
                      todo_item(
                            Todos_items: todo,
                        todochange: _handletodolist,
                        tododeleteitem: _deletitem,
                          ),
                  ],
                ),
              )
            ],)
            ),
          ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20

                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0,0.0),
                        blurRadius: 10,
                        spreadRadius: 0.0
                      ),],
                    ),
                    child: TextField(
                      controller: todocontroller,
                      decoration: InputDecoration(
                        hintText: 'Add Item',
                        border: InputBorder.none,
                      ),
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        _additem(todocontroller.text);
                      },
                      child: Text('+',style: TextStyle(fontSize: 40),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        minimumSize: Size(60, 60),
                        elevation: 10
                      ),
                    ),
                  )
                ],
              ),
            )
      ],
        ),

      ),
    );
  }

  void _handletodolist(Todo todo){
  setState(() {
    todo.pass=!todo.pass;
  });
  }

  void _deletitem(String id){
    setState(() {
      todos_list.removeWhere((item) => item.id == id);
    });
  }

  void _additem(String todo){
    setState(() {
      todos_list.add(Todo(id: DateTime.now().millisecondsSinceEpoch.toString(), todotext: todo));
    });
    todocontroller.clear();
  }



  Widget searchbox(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,size: 20,color: Colors.black,),
            prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
                minWidth: 25
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey)
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: Color(0XFFecedf4),
        elevation: 0,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              size: 30,
              color: Colors.black,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/avtar.jpg'),
              ),
            )
          ],
        ),
      );
  }
}
