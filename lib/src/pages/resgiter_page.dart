import 'package:flutter/material.dart';

import 'package:pagosapp_group/providers/login_providers.dart';
import 'package:pagosapp_group/services/user_services.dart';
import 'package:pagosapp_group/src/models/user_model.dart';
import 'package:pagosapp_group/src/pages/login_page.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                Row( children:[ic(context),titulo(context)]),
               
              
               
                SizedBox(height: 20),
                UsernameSignUpTextControl(),
                SizedBox(height: 20),
                EmailSignUpTextControl(),
                PasswordSignUpTextControl(),
                SizedBox(height: 25.0),
                SubmitSignUpButtonControl(),
                SizedBox(height: 25.0),
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
          Text("REGISTRARSE",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

class UsernameSignUpTextControl extends StatelessWidget {
  const UsernameSignUpTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.ofSing(context);
    return StreamBuilder(
      stream: bloc.usernameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.person,
                    color: Theme.of(context).primaryColorDark),
                hintText: 'Nombre de usuario',
                labelText: 'Usuario',
                errorText: snapshot.error?.toString()),
            onChanged: bloc.changeUsername);
      },
    );
  }
}

class EmailSignUpTextControl extends StatelessWidget {
  const EmailSignUpTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.ofSing(context);
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.email,
                    color: Theme.of(context).primaryColorDark),
                hintText: 'usuario@trackmedical.com',
                labelText: 'Correo electrónico',
                errorText: snapshot.error?.toString()),
            onChanged: bloc.changeEmail);
      },
    );
  }
}

class PasswordSignUpTextControl extends StatelessWidget {
  const PasswordSignUpTextControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.ofSing(context);
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock_outline,
                  color: Theme.of(context).primaryColorDark),
              labelText: 'Contraseña',
              errorText: snapshot.error?.toString()),
        );
      },
    );
  }
}

class SubmitSignUpButtonControl extends StatelessWidget {
  const SubmitSignUpButtonControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserService userService = new UserService();
    final bloc = LoginProvider.ofSing(context);
    return StreamBuilder(
      stream: bloc.formSingUpValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
              child: Text('Registrar'),
            ),
            onPressed: snapshot.hasData
                ? () async {
                    User user = new User();
                    user.displayName = bloc.username;
                    user.email = bloc.email;
                    user.password = bloc.password;
                    bool create = await userService.sendUser(user);
                    if (create) {
                      Navigator.pop(context);
                    } else {
                      print("Error al crear el usuario");
                    }
                  }
                : null);
      },
    );
  }
}
Widget ic(context){
  return Container(child: Center(child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [ 
      IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
    iconSize: 40,
            onPressed: () =>{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>LoginPage())

          )
            
          },
          ),
    ],
  ),),);
}
/*
class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  _SingUpPageState createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final formKey = GlobalKey<FormState>();
  UserService userService = new UserService();
  User user = new User();
  bool _onSaving = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            BackgroundWidget(),
            SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(child: Container(height: 180.0)),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: size.width * .80,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                blurRadius: 2.0,
                                offset: Offset(0.0, 1.0),
                                spreadRadius: 2.0)
                          ]),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text('Registro de usuario',
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        SizedBox(height: 25.0),
                        Form(
                            key: formKey,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 7.0),
                              child: Column(
                                children: [
                                  TextFormField(
                                      initialValue: user.displayName,
                                      onSaved: (value) {
                                        user.displayName = value.toString();
                                      },
                                      validator: (value) {
                                        if (value!.length < 10) {
                                          return "El nombre de usuario debe tener al menos 10 caracteres";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.person,
                                            color: Theme.of(context)
                                                .primaryColorDark),
                                        hintText: 'Nombre de usuario',
                                        labelText: 'Usuario',
                                      )),
                                  SizedBox(height: 25.0),
                                  TextFormField(
                                      initialValue: user.email,
                                      onSaved: (value) {
                                        user.email = value.toString();
                                      },
                                      validator: (value) {
                                        String pattern =
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                        RegExp regExp = new RegExp(pattern);
                                        if (!regExp
                                            .hasMatch(value!.toString())) {
                                          return "Debe ingresar un correo electrónico";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.email,
                                            color: Theme.of(context)
                                                .primaryColorDark),
                                        hintText: 'usuario@correo.com',
                                        labelText: 'Correo electrónico',
                                      )),
                                  SizedBox(height: 25.0),
                                  TextFormField(
                                      obscureText: true,
                                      initialValue: user.password,
                                      onSaved: (value) {
                                        user.password = value.toString();
                                      },
                                      validator: (value) {
                                        if (value!.length < 6) {
                                          return "La contraseña debe tener al menos 6 caracteres";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.lock,
                                            color: Theme.of(context)
                                                .primaryColorDark),
                                        labelText: 'Contraseña',
                                      )),
                                  SizedBox(height: 25.0),
                                  _onSaving
                                      ? Container(
                                          height: 50.0,
                                          width: 50.0,
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()))
                                      : ElevatedButton(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                                vertical: 7.0),
                                            child: Text('Registrar'),
                                          ),
                                          onPressed: () {
                                            _sendForm();
                                          }),
                                  SizedBox(height: 25.0)
                                ],
                              ),
                            )),
                      ]))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sendForm() async {
    if (!formKey.currentState!.validate()) return;

    _onSaving = true;
    setState(() {});

    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState!.save();
    bool created = await userService.sendUser(user);
    if (created) {
      formKey.currentState!.reset();
      _onSaving = false;
      Navigator.pop(context);
    }
  }
}
*/