import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/utils/enums.dart';
//import 'package:pagosapp_group/src/widgets/content/home_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  //@override
  void initStatet() {
    super.initState();
    print("Inicio del estado");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: contentWidget[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            _selectedIndex = value;
            setState(() {
              print("cambio de estado");
            });
          },
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
              .toList()),
    );
  }
}
