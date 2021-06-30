import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/login_page.dart';

import 'resgiter_page.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.titulo}) : super(key: key);
  final String titulo;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
        
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/fondo2.png'),
            fit: BoxFit.cover,
          )),
          child: Center(
              child: Column(children: <Widget>[
            Image.asset('assets/images/icono_user.png'),
            Text("Bienvenido a tu aplicacion",
                style: TextStyle(color: Colors.black, fontSize: 25)),
                 SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.black)),
              minWidth: 250.0,
              height: 40.0,
              onPressed: () =>{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>LoginPage())

              )
                
              },
              color: Colors.white,
              child: Text('Iniciar Sesion',
                  style: TextStyle(color: Colors.black, fontSize: 30)),
            ),
             SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.black)),
              minWidth: 250.0,
              height: 40.0,
             onPressed: () =>{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>RegisterPage())

              )
                
              },
              color: Colors.lightBlue,
              child: Text('Registrarse',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
          ])),
        ),
      ],
    );
  }
}
