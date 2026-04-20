import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/firebase_utils/firebase_utils.dart';
import 'package:todo_app/core/settings_provider/setting_provider.dart';
import 'package:todo_app/l10n/app_localizations.dart';
import 'package:todo_app/model/task_model.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskModel taskModel;
  const TaskItemWidget({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    var provider = Provider.of<SettingProvider>(context);
    var lang = AppLocalizations.of(context)!;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: provider.isDark() ? Color(0xFF141922) : Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: 0.2,
          children: [
            SlidableAction(
              onPressed: (context) {
                EasyLoading.show();
                FirebaseUtils.deleteTaskFromFirebase(
                  taskModel,
                ).then((value) => EasyLoading.dismiss());
              },
              padding: EdgeInsets.zero,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: provider.isDark() ? Color(0xFF141922) : Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            leading: Container(
              width: 6,
              height: 140,
              decoration: BoxDecoration(
                color: taskModel.isDone
                    ? Color(0xFF61E757)
                    : theme.primaryColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: taskModel.isDone
                        ? Color(0xFF61E757)
                        : theme.primaryColor,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  taskModel.detail,
                  maxLines: 3,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: provider.isDark() ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight(500),
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      size: 16,
                      color: provider.isDark() ? Colors.white : Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      DateFormat('hh:mm a', provider.currentLanguage).format(
                        DateTime.fromMillisecondsSinceEpoch(
                          taskModel.selectedDate.millisecondsSinceEpoch,
                        ),
                      ),
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: provider.isDark() ? Colors.white : Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: taskModel.isDone
                ? Text(
                    lang.done,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Color(0xFF61E757),
                      fontSize: 18,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      EasyLoading.show();
                      FirebaseUtils.updateTaskIsDone(
                        taskModel,
                      ).then((value) => EasyLoading.dismiss());
                    },
                    child: Container(
                      width: 70,
                      height: 35,
                      decoration: BoxDecoration(
                        color: taskModel.isDone
                            ? Color(0xFF61E757)
                            : theme.primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ImageIcon(
                        AssetImage("assets/icons/icon_check.png"),
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
