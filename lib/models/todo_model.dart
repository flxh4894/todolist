class ToDo {
  int? index;
  final String todo;
  final bool flag;

  ToDo({
    this.index,
    required this.todo,
    required this.flag,
  });

  factory ToDo.fromJson(json) => ToDo(index: json['index'], todo: json['todo'], flag: json['flag']);

  Map<String, dynamic> toJson() => {
    "index": index,
    "todo": todo,
    "flag": flag,
  };
}
