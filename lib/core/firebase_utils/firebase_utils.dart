import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/core/utils.dart';
import 'package:todo_app/model/task_model.dart';

class FirebaseUtils {
  static CollectionReference<TaskModel> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection(TaskModel.collectionName)
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.firestore(snapshot.data()!),
          toFirestore: (taskModel, _) => taskModel.toFirestore(),
        );
  }

  static Future<void> addTaskToFirebase(TaskModel taskModel) async {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc();
    taskModel.id = docRef.id;
    return docRef.set(taskModel);
  }

  static Future<List<TaskModel>> getOneTimeReadFromFireStore(
    DateTime selectedDate,
  ) async {
    var collectionRef = getCollectionRef().where(
      "selectedDate",
      isEqualTo: extractDate(selectedDate).microsecondsSinceEpoch,
    );
    var data = await collectionRef.get();
    var tasksList = data.docs.map((e) => e.data()).toList();
    return tasksList;
  }

  static Stream<List<TaskModel>> getTasksStream(DateTime date) {
    return getCollectionRef().snapshots().map(
      (snapshot) => snapshot.docs
          .map((doc) => doc.data())
          .where(
            (task) =>
                task.selectedDate.day == date.day &&
                task.selectedDate.month == date.month &&
                task.selectedDate.year == date.year,
          )
          .toList(),
    );
  }

  static Future<void> updateTaskIsDone(TaskModel taskModel) async {
    var collectionRef = getCollectionRef();
    taskModel.isDone = true;
    return collectionRef.doc(taskModel.id).update(taskModel.toFirestore());
  }

  static Future<void> deleteTaskFromFirebase(TaskModel taskModel) async {
    var collectionRef = getCollectionRef();
    return collectionRef.doc(taskModel.id).delete();
  }
}
