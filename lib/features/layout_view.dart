import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/setting_provider.dart';
import 'package:todo_app/features/settings/settings_view.dart';
import 'package:todo_app/features/tasks/tasks_view.dart';
import 'package:todo_app/features/tasks/widgets/add_task_bottom_sheet.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  final List<Widget> screens = [TasksView(), SettingsView()];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      body: screens[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskBottomSheet(),
          );
        },
        backgroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: CircleAvatar(
          radius: 28,
          backgroundColor: theme.primaryColor,
          child: Icon(Icons.add, size: 35, color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        color: provider.isDark() ? Color(0xFF141922) : Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/icon_list.png")),
              label: "Tasks",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/icons/icon_settings.png")),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
