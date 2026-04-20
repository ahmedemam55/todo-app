import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/firebase_utils/firebase_utils.dart';
import 'package:todo_app/core/services/snack_bar_services.dart';
import 'package:todo_app/core/settings_provider/setting_provider.dart';
import 'package:todo_app/l10n/app_localizations.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/core/services/notification_service.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var detailController = TextEditingController();
  DateTime selecteDate = DateTime.now();
  late SettingProvider provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of<SettingProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: provider.isDark() ? const Color(0xFF141922) : Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              lang.add_new_task,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: provider.isDark() ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: lang.enter_your_task_title,
                hintStyle: TextStyle(
                  color: provider.isDark()
                      ? Colors.white.withOpacity(0.6)
                      : Colors.black.withOpacity(0.6),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please enter task title";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: detailController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: lang.enter_your_task_details,
                hintStyle: TextStyle(
                  color: provider.isDark()
                      ? Colors.white.withOpacity(0.6)
                      : Colors.black.withOpacity(0.6),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "please enter task Details";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            Text(
              lang.select_time,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: provider.isDark() ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: getSelectedDate,
              child: Text(
                DateFormat(
                  "dd MMM yyyy  hh:mm a",
                  provider.currentLanguage,
                ).format(selecteDate),
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: provider.isDark() ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var taskModel = TaskModel(
                    title: titleController.text,
                    detail: detailController.text,
                    selectedDate: selecteDate,
                  );
                  EasyLoading.show();
                  FirebaseUtils.addTaskToFirebase(taskModel).then((value) {
                    NotificationService.scheduleNotification(
                      id: taskModel.id.hashCode,
                      title: taskModel.title,
                      body: taskModel.detail,
                      scheduledDate: taskModel.selectedDate,
                    );
                    Navigator.pop(context);
                    EasyLoading.dismiss();
                    SnackBarServices.showSuccessMessage(
                      'Task successfully added!',
                    );
                  });
                }
              },
              style: FilledButton.styleFrom(
                backgroundColor: theme.primaryColor,
              ),
              child: Text(
                lang.save,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: provider.isDark() ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getSelectedDate() async {
    // ── 1. اختار اليوم ────────────────────────────────────────────────────
    var currentDate = await showDatePicker(
      context: context,
      locale: Locale(provider.currentLanguage),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (currentDate == null) return;

    // ── 2. اختار الوقت ───────────────────────────────────────────────────
    var currentTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (currentTime == null) return;

    setState(() {
      selecteDate = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        currentTime.hour,
        currentTime.minute,
      );
    });
  }

  // Future<void> getSelectedDate() async {
  //   var currentDate = await showDatePicker(
  //     context: context,
  //     locale: Locale(provider.currentLanguage),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime.now().add(const Duration(days: 365)),
  //   );
  //   if (currentDate != null) {
  //     setState(() {
  //       selecteDate = currentDate;
  //     });
  //   }
  // }
}
