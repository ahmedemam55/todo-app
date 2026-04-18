import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/setting_provider.dart';
import 'package:todo_app/l10n/app_localizations.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    var provider = Provider.of<SettingProvider>(context);
    var lang = AppLocalizations.of(context)!;

    final List<String> _language = ['English', 'عربي'];
    final List<String> _theme = [lang.light, lang.dark];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Container(
            padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
            width: mediaQuery.size.width,
            height: mediaQuery.size.height * 0.22,
            color: theme.primaryColor,
            child: Text(
              lang.settings,
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 22,
                color: provider.isDark() ? Color(0xFF060E1E) : Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(lang.language, style: theme.textTheme.bodyLarge),
              SizedBox(height: 20),
              CustomDropdown<String>(
                // hintText: 'Select job role',
                items: _language,
                initialItem: provider.currentLanguage == 'en'
                    ? _language[0]
                    : _language[1],
                onChanged: (value) {
                  if (value == 'English') {
                    provider.changeCurrentLanguage('en');
                  }
                  if (value == 'عربي') {
                    provider.changeCurrentLanguage('ar');
                  }
                },
                decoration: CustomDropdownDecoration(
                  closedFillColor: provider.isDark()
                      ? Color(0xFF141922)
                      : Colors.white,
                  expandedFillColor: provider.isDark()
                      ? Color(0xFF141922)
                      : Colors.white,
                  closedSuffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: provider.isDark()
                        ? theme.primaryColor
                        : Colors.black,
                  ),
                  expandedSuffixIcon: Icon(
                    Icons.arrow_drop_up,
                    color: provider.isDark()
                        ? theme.primaryColor
                        : Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(lang.theme_mode, style: theme.textTheme.bodyLarge),
              SizedBox(height: 20),
              CustomDropdown<String>(
                // hintText: 'Select job role',
                items: _theme,
                initialItem: provider.currentThemeMode == ThemeMode.light
                    ? _theme[0]
                    : _theme[1],
                onChanged: (value) {
                  if (value == lang.light) {
                    provider.changeCurrentThemeMode(ThemeMode.light);
                  }
                  if (value == lang.dark) {
                    provider.changeCurrentThemeMode(ThemeMode.dark);
                  }
                },

                decoration: CustomDropdownDecoration(
                  closedFillColor: provider.isDark()
                      ? Color(0xFF141922)
                      : Colors.white,
                  expandedFillColor: provider.isDark()
                      ? Color(0xFF141922)
                      : Colors.white,
                  closedSuffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: provider.isDark()
                        ? theme.primaryColor
                        : Colors.black,
                  ),
                  expandedSuffixIcon: Icon(
                    Icons.arrow_drop_up,
                    color: provider.isDark()
                        ? theme.primaryColor
                        : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
