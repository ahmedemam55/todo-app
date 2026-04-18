import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/application_theme_manager.dart';
import 'package:todo_app/core/page_route_names.dart';
import 'package:todo_app/core/route_generator.dart';
import 'package:todo_app/core/setting_provider.dart';
import 'package:todo_app/l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider<SettingProvider>(
      create: (context) => SettingProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      title: 'To Do Listd',
      debugShowCheckedModeBanner: false,
      locale: Locale(provider.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ApplicationThemeManager.lightTheme,
      themeMode: provider.currentThemeMode,
      darkTheme: ApplicationThemeManager.darkTheme,
      initialRoute: PageRouteNames.initial,
      onGenerateRoute: RouteGenerator.onGeneratRoute,
    );
  }
}
