import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/main_page.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';



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
      
      body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Standard.getBackground(context),
            Column(
              children: [
                SizedBox(height: 35.0),
                SizedBox(
                  height: 40.0,
            
                ),
                ClipOval(child: Image.asset('assets/images/icono_tarjeta.png',height: 100,)),  
                Standard.TitleToForm(context, "Registro de Tarjeta"),
                _form(context)
              ],
            )
          ],
        ));
  }
   
    
    
  }
  
 

_form(context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            width: size.width * .80,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Theme.of(context).dividerColor)),
            child: Form(
                //key: formKey,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 32.0, horizontal: 5.0),
                  child: Column(
                    children: [
                
            
              name(context),
              SizedBox(height: 20),
              boton(context)
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

Widget name(context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal:15,vertical:5),
    child: TextField(
     
      decoration: InputDecoration(
         suffixIcon: Icon(Icons.person), labelText: "Nombre",
        border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),),
          focusedBorder:OutlineInputBorder(
            borderSide:  BorderSide(color: Theme.of(context).accentColor,width: 3.0),
         ),
     

      ),
    ),
  );
}


Widget boton(context) {
  return Container(
    child: MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.black)),
      minWidth: 30.0,
      height: 10.0,
      onPressed: () {},
      color:Theme.of(context).accentColor,
      child:
          Text('Agregar',
              style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold)),),
    
  );
}
