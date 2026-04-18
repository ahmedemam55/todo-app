import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/setting_provider.dart';
import 'package:todo_app/features/tasks/widgets/task_item_widget.dart';
import 'package:todo_app/l10n/app_localizations.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  DateTime _focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    var provider = Provider.of<SettingProvider>(context);
    var lang = AppLocalizations.of(context)!;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
                width: mediaQuery.size.width,
                height: mediaQuery.size.height * 0.22,
                color: theme.primaryColor,
                child: Text(
                  lang.to_do_list,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 22,
                    color: provider.isDark() ? Color(0xFF060E1E) : Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: -55,
                left: 0,
                right: 0,
                child: EasyInfiniteDateTimeLine(
                  locale: provider.currentLanguage,
                  firstDate: DateTime(2026),
                  focusDate: _focusDate,
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  onDateChange: (selectedDate) {
                    setState(() {
                      _focusDate = selectedDate;
                    });
                  },
                  showTimelineHeader: false,
                  timeLineProps: EasyTimeLineProps(separatorPadding: 10),
                  dayProps: EasyDayProps(
                    activeDayStyle: DayStyle(
                      decoration: BoxDecoration(
                        color: provider.isDark()
                            ? Color(0xFF141922)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      monthStrStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      dayNumStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      dayStrStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    inactiveDayStyle: DayStyle(
                      decoration: BoxDecoration(
                        color: provider.isDark()
                            ? Color(0xFF141922).withOpacity(0.8)
                            : Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      monthStrStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: provider.isDark() ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                      dayNumStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: provider.isDark() ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                      dayStrStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: provider.isDark() ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    todayStyle: DayStyle(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      monthStrStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      dayNumStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      dayStrStyle: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => TaskItemWidget(),
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
