import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/home_page.dart';

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
           
            children:<Widget> [
         SizedBox(height: 20),
              ic(context),
                  SizedBox(height: 30),
              titulo(),
                  SizedBox(height: 20),
              user(),
                    SizedBox(height: 20),
              email(),
                    SizedBox(height: 20),
              password(),
        SizedBox(height: 20),
              boton()
        
            ],
          ),
        ),
      ),

      ),
    );
    
  }
 
}
Widget titulo(){
    return Container(child: Center(child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("REGISTRARSE",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700),)
    ],
  ),),);

}
Widget user(){
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
        hintText: "NOMBRE DE USUARIO",
         hintStyle: TextStyle(fontWeight: FontWeight.w700 ,color: Color.fromRGBO(49, 150, 174, 1)),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget email(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal:15,vertical:5),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),),
       
         focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 3.0),
         ),
        hintText: "CORREO",
        hintStyle: TextStyle(fontWeight: FontWeight.w700 ,color: Color.fromRGBO(49, 150, 174, 1)),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget password(){
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
         hintStyle: TextStyle(fontWeight: FontWeight.w700 ,color: Color.fromRGBO(49, 150, 174, 1)),
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
          minWidth: 325.0,
          height: 50.0,
          onPressed: () {},
          color: Color.fromRGBO(46, 44, 180,1),
          child: Text('Registrarse',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ) ,);
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