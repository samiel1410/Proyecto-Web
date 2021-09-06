import 'package:flutter/material.dart';
import 'package:pagosapp_group/providers/app_provider.dart';
import 'package:pagosapp_group/providers/login_providers.dart';
import 'package:pagosapp_group/services/user_services.dart';
import 'package:pagosapp_group/src/pages/resgiter_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/fondo2.png'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20),
                titulo(context),
                SizedBox(height: 20),
                EmailTextControl(),
                SizedBox(height: 20),
                PasswordTextControl(),
                SizedBox(height: 30),
                SubmitButtonControl(),
                nologin(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget titulo(context) {
  return Container(
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("INICIAR SESION",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

class EmailTextControl extends StatelessWidget {
  const EmailTextControl({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
              decoration: InputDecoration(
                 icon: Icon(Icons.email,
                    color: Theme.of(context).primaryColorDark),
                hintText: "usuario@pagos.com",
                labelText: 'Correo Electronico',
                errorText: snapshot.error?.toString(),
              ),
              onChanged: bloc.changeEmail);
        });
  }
}

class PasswordTextControl extends StatelessWidget {
  const PasswordTextControl({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
               icon: Icon(Icons.lock_outline,
                  color: Theme.of(context).primaryColorDark),
              labelText: 'Contraseña',
              errorText: snapshot.error?.toString(),
            ),
          );
        });
  }
}

Widget nologin(context) {
  return Container(
      child: Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No estas registrado!",
          style: TextStyle(fontSize: 20),
        ),
        TextButton(
            onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()))
                },
            child: Text(
              "Registrarse",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ))
      ],
    ),
  ));
}

class SubmitButtonControl extends StatelessWidget {
  const SubmitButtonControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    UserService userService = new UserService();
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
              child: Text('Ingresar'),
            ),
            onPressed: snapshot.hasData
                ? () async {
                    Map info =
                        await userService.login(bloc.email, bloc.password);

                    if (info['ok']) {
                      appProvider.token = info['token'];
                    } else {
                      print(info['message']);
                    }
                  }
                : null);
      },
    );
  }
}
