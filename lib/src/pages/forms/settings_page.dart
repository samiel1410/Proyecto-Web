import 'package:flutter/material.dart';
import 'package:pagosapp_group/providers/app_provider.dart';
import 'package:pagosapp_group/src/utils/user_shared_preferences.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool? darkModePrefs;

  @override
  void initState() {
    super.initState();
    _loadDarkModePrefs();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          darkModePrefs == null
              ? Container()
              : Card(
                  elevation: 5.0,
                  child: ListTile(
                    title: Text("Modo obscuro",
                        style: Theme.of(context).textTheme.bodyText1),
                    subtitle: Text(
                        "El modo obscuro tiene un fondo opaco con un constrate de letras claro.",
                        style: Theme.of(context).textTheme.caption),
                    leading: Checkbox(
                        value: darkModePrefs,
                        onChanged: (value) {
                          appProvider.darkMode = value ?? false;
                          setDarkMode(value ?? false);
                          if (value == true) {
                            print("Modo nocturno activado");
                          } else {
                            print("Modo nocturno desactivado");
                          }
                          Navigator.pop(context);
                        }),
                  ),
                )
        ],
      ),
    );
  }

  _loadDarkModePrefs() async {
    darkModePrefs = await getDarkMode();
    setState(() {});
  }
}
