class Todo{
  String? id;
  String? todotext;
  late bool pass;

  Todo({
    required this.id,
    required this.todotext,
    this.pass=false,
});

  static List<Todo> todolist(){
    return[
      Todo(id: '01',todotext: 'Morning walk',pass: true),
      Todo(id: '02',todotext: 'Exercise',pass: true),
      Todo(id: '03',todotext: 'Homework'),
      Todo(id: '04',todotext: '09:00 PM  Urgent meeting'),
      Todo(id: '05',todotext: 'Dinner with Friends'),
      Todo(id: '06',todotext: 'Check Mails'),
    ];
  }

}