import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/setting_provider.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    var provider = Provider.of<SettingProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      decoration: BoxDecoration(
        color: provider.isDark() ? Color(0xFF141922) : Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: Container(
          width: 6,
          height: 140,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Play Basket Ball',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.primaryColor,
                fontSize: 18,
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
                  ' 10 : 30 AM ',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: provider.isDark() ? Colors.white : Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight(500),
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Container(
          width: 70,
          height: 35,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ImageIcon(
            AssetImage("assets/icons/icon_check.png"),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
