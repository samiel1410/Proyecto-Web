import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pagosapp_group/providers/app_provider.dart';
import 'package:pagosapp_group/src/pages/forms/expense_form.dart';
import 'package:pagosapp_group/src/pages/forms/income_form.dart';
import 'package:pagosapp_group/src/pages/forms/settings_page.dart';

import 'package:pagosapp_group/src/utils/enums.dart';
import 'package:provider/provider.dart';

//import 'package:pagosapp_group/src/widgets/content/home_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    int selectedPage = appProvider.selectedPage;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text(selectedPage == 0 ? titulo : menuOptions[selectedPage].label),
        /*actions: [
          PopupMenuButton<ItemMenu>(
            onSelected: (value) {
              if (value.label == "Configuración") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              }
            },
            itemBuilder: (BuildContext context) {
              return settingsOptions.map((ItemMenu option) {
                return PopupMenuItem<ItemMenu>(
                    value: option,
                    child: Row(
                      children: [
                        Icon(option.icon,
                            color: Theme.of(context).primaryColor),
                        SizedBox(width: 14.0),
                        Text(option.label)
                      ],
                    ));
              }).toList();
            },
          ),
        ],*/
      ),
      body: Container(child: contentWidget[selectedPage]),
      floatingActionButton: selectedPage == 0
          ? SpeedDial(
              animatedIcon: AnimatedIcons.menu_close,
              animatedIconTheme: IconThemeData(size: 22),
              backgroundColor: Theme.of(context).accentColor,
              visible: true,
              curve: Curves.bounceIn,
              children: [
                // INCOME
                SpeedDialChild(
                    child: Icon(Icons.add),
                    backgroundColor: Theme.of(context).accentColor,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IncomeForm()));
                    },
                    label: 'Ingresos',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16.0),
                    labelBackgroundColor: Theme.of(context).accentColor),
                // EXPENSE
                SpeedDialChild(
                    child: Icon(Icons.money_off),
                    backgroundColor: Theme.of(context).accentColor,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExpenseForm()));
                    },
                    label: 'Gastos',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16.0),
                    labelBackgroundColor: Theme.of(context).accentColor),
                //SHARED PREFRENCE(THEME)
                SpeedDialChild(
                    child: Icon(Icons.settings),
                    backgroundColor: Theme.of(context).accentColor,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                    },
                    label: 'Configuración',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16.0),
                    labelBackgroundColor: Theme.of(context).accentColor)
              ],
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (value) {
            appProvider.selectedPage = value;
          },
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
              .toList()),
    );
  }
}
