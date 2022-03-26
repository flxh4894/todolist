class ToDo {
  int? index;
  final String todo;
  final bool flag;
  final String? desc;
  final String? hashTag;

  ToDo({
    this.index,
    required this.todo,
    required this.flag,
    this.desc,
    this.hashTag,
  });

  factory ToDo.fromJson(json) => ToDo(
        index: json['index'],
        todo: json['todo'],
        flag: json['flag'],
        desc: json['desc'],
        hashTag: json['hashTag'],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "todo": todo,
        "flag": flag,
      };
}
