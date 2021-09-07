import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/foundation.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  await Preferences().init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<GoalElementProvider>(
        create: (_) => GoalElementProvider()),
    ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider())
  ], child: MyApp()));
}
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final prefs = new Preferences();

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      print('An initial message event was published!');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('A new onMessage event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }

      print(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print(message);
    });
  }
  
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

