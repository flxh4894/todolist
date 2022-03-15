class ToDo {
  final String todo;
  final bool flag;

  ToDo({
    required this.todo,
    required this.flag,
  });

  factory ToDo.fromJson(json) => ToDo(todo: json['todo'], flag: json['flag']);
}
