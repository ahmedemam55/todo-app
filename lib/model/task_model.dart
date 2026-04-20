class TaskModel {
  static const String collectionName = 'tasksCollection';
  String? id;
  String title;
  String detail;
  DateTime selectedDate;
  bool isDone;

  TaskModel({
    this.id,
    required this.title,
    required this.detail,
    required this.selectedDate,
    this.isDone = false,
  });

  factory TaskModel.firestore(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      detail: json['detail'],
      selectedDate: DateTime.fromMillisecondsSinceEpoch(json['selectedDate']),
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'detail': detail,
      'selectedDate': selectedDate.millisecondsSinceEpoch,
      'isDone': isDone,
    };
  }
}
