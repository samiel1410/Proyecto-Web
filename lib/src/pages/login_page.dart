import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/home_page.dart';
import 'package:pagosapp_group/src/pages/resgiter_page.dart';

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
           
            children:<Widget> [
               SizedBox(height: 20),
              ic(context),
                  SizedBox(height: 40),
              titulo(context),
                  SizedBox(height: 20),
              user(context),
                    SizedBox(height: 20),
              password(context),
        SizedBox(height: 30),
              boton(),
              nologin(context)
        
            ],
          ),
        ),
      ),

      ),
    );
    
  }
 
}
Widget titulo(context){
    return Container(child: Center(child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("INICIAR SESION",style:  Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold)),
    ],
  ),),);

}
Widget user(context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal:15,vertical:5),
    child: TextField(
     
      decoration: InputDecoration(
        border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),),
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 3.0),
         ),
        hintText: " USUARIO O CORREO",
         hintStyle: TextStyle(fontWeight: FontWeight.w700 ,color: Theme.of(context).accentColor),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}



Widget password(context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal:15,vertical:5),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),),
         focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 3.0),
         ),
        hintText: "CONTRASEÑA",
        hintStyle: TextStyle(fontWeight: FontWeight.w700 ,color: Theme.of(context).accentColor),
        fillColor: Colors.white,
        filled: true,
        
      ),
    ),
  );
}
Widget boton(){
  return Container(child:MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.black)),
          minWidth: 60.0,
          height: 50.0,
          onPressed: () {},
          color: Color.fromRGBO(46, 44, 180,1),
          child: Text('INICIAR SESION',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ) ,);
}
Widget nologin(context){
  return Container
  (
    child:Center(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,

    children: [
      Text("No estas registrado!",style: TextStyle(fontSize: 20),),
      TextButton(onPressed: () =>{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>RegisterPage())

          )
            
          }, child: Text("Registrarse",style: TextStyle(color: Colors.red, fontSize: 20),))
    ],
  ),));
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
            MaterialPageRoute(builder: (context)=>HomePage(titulo: "",))

          )
            
          },
          ),
    ],
  ),),);
}