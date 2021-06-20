import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView( 
       
        children: [
          Image.asset("assets/images/icono_user.png"),
          Text("Samiel Morejon",style:Theme.of(context).textTheme.headline5),
          Text("samiel_141099@hotmail.com ",style:Theme.of(context).textTheme.headline5),
          Text("2 ",style:Theme.of(context).textTheme.headline5),
          Text("DEUDAS PENDIENTES",style:Theme.of(context).textTheme.headline5)
        ],
      ),
    );
  }
}