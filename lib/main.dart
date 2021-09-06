import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pagosapp_group/providers/app_provider.dart';
import 'package:pagosapp_group/providers/goal_elements.dart';
import 'package:pagosapp_group/providers/login_providers.dart';
import 'package:pagosapp_group/src/pages/forms/settings_page.dart';
import 'package:pagosapp_group/src/pages/login_page.dart';
import 'package:pagosapp_group/src/pages/main_page.dart';
import 'package:pagosapp_group/src/pages/resgiter_page.dart';
import 'package:pagosapp_group/src/utils/user_shared_preferences.dart';
import 'package:provider/provider.dart';



Future<void> main() async {
  await Preferences().init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<GoalElementProvider>(
        create: (_) => GoalElementProvider()),
    ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider())
  ], child: MyApp()));
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final prefs = new Preferences();
  
 Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: true);
    appProvider.init(prefs.token, prefs.mode);
    return LoginProvider(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'AppPagos',
            home: appProvider.token == ""
                ? const LoginPage()
                : JwtDecoder.isExpired(appProvider.token)
                    ? const LoginPage()
                    : const MainPage(titulo: "AppPagos"),
            routes: {
              "/login": (context) => const LoginPage(),
              "/singUp": (context) => const RegisterPage(),
              "/settings": (context) => const SettingsPage(),
            
            },
            theme: ThemeData(
                brightness: appProvider.darkMode == true
                    ? Brightness.dark
                    : Brightness.light,
                primarySwatch: Colors.lightBlue)));
  }
}

