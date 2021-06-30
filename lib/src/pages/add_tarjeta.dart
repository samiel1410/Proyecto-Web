import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/main_page.dart';



class AddTarjeta extends StatelessWidget {
  const AddTarjeta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainPage()
                          ))
            },
        ),),
      
      body: Container(
        
      
      child: Center(
        child: Center(
          child: ListView(
           
            children:<Widget> [

        
          
            SizedBox(height: 20),
         Image.asset('assets/images/icono_tarjeta.png',height: 100,),
    
            
                  SizedBox(height: 30),
              titulo(),
                  SizedBox(height: 20),
              user(context),
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
        hintText: "NOMBRE",
         hintStyle: TextStyle(color: Theme.of(context).accentColor),
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
