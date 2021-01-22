class Todo{
  final int _id;
  final String _title;
  final String _description;
  bool _isDone;

  Todo(this._id, this._title, this._description, this._isDone);

  int get id => _id;
  String get title => _title;
  String get description => _description;
  bool get isDone => _isDone;

  void toggleIsDone(){
    _isDone = !_isDone;
  }

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(json['id'], json['title'], json['description'], json['isDone']);
  }

  Map<String, dynamic> toJson(){
    return {
      'id': _id,
      'title': _title,
      'description': _description,
      'isDone': _isDone
    };
  }
}