import 'package:flutter/material.dart';
import 'package:pagosapp_group/providers/app_provider.dart';
import 'package:pagosapp_group/providers/goal_elements.dart';
import 'package:pagosapp_group/src/pages/main_page.dart';
import 'package:provider/provider.dart';

import 'src/utils/user_shared_preferences.dart';

Future<void> main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<GoalElementProvider>(
        create: (_) => GoalElementProvider()),
    ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
        create: (BuildContext context) => AppProvider(),
        child: Consumer<AppProvider>(builder: (context, provider, __) {
          getDarkMode().then((value) => provider.darkMode = value);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            
            theme: ThemeData(
                brightness: provider.darkMode == true
                    ? Brightness.dark
                    : Brightness.light,
                primarySwatch: Colors.lightBlue),
            home: MainPage(
              titulo: 'Registro de Gastos ',
            ),
          );
        }));
  }
}
