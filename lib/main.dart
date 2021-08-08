
import 'package:flutter/material.dart';
import 'package:pagosapp_group/providers/app_provider.dart';
import 'package:pagosapp_group/providers/goal_elements.dart';
import 'package:pagosapp_group/src/pages/main_page.dart';
import 'package:provider/provider.dart';

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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Aplicacion',
            home: MainPage(),
          );
        }));
  }
}
