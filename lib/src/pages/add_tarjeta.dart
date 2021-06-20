import 'package:flutter/material.dart';

import 'home_page.dart';

class AddTarjeta extends StatelessWidget {
  const AddTarjeta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        
      
      child: Center(
        child: Center(
          child: ListView(
           
            children:<Widget> [

        
           ic(context),
            SizedBox(height: 20),
         Image.asset('assets/images/icono_tarjeta.png',height: 100,),
    
            
                  SizedBox(height: 30),
              titulo(),
                  SizedBox(height: 20),
              user(),
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
      Text("Agregar Tarjeta",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700),)
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
        hintText: "NOMBRE",
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
          minWidth: 10.0,
          height: 50.0,
          onPressed: () {},
          color: Color.fromRGBO(46, 44, 170,1),
          child: Text('Agregar',
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