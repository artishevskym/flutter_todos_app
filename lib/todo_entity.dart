class TodoEntity {
  String title;
  bool isDone;

  TodoEntity({this.title, this.isDone = false}): assert(title.isNotEmpty);
}
