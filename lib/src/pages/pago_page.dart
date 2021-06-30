import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/main_page.dart';
//import 'package:provider/provider.dart';

class PagoPage extends StatelessWidget {
  const PagoPage({Key? key}) : super(key: key);

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
              children: <Widget>[
              
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/icono_pago.png',
                  height: 200,
                ),
                SizedBox(height: 30),
                titulo(),
                SizedBox(height: 20),
                user(),
                SizedBox(height: 20),
                descripcion(context),
                SizedBox(height: 20),
                monto(),
                SizedBox(height: 20),
                ubicacion(),
                SizedBox(height: 20),
                TipoPago(),
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

Widget titulo() {
  return Container(
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Agregar Pago",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
          )
        ],
      ),
    ),
  );
}

Widget user() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 3.0),
        ),
        hintText: "NOMBRE",
        hintStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(49, 150, 174, 1)),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget descripcion(context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      style: TextStyle(color: Colors.blueGrey),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 3.0),
        ),
        hintText: "Descripcion",
        hintStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).accentColor),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget monto() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 3.0),
        ),
        hintText: "Monto",
        hintStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(49, 150, 174, 1)),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget ubicacion() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 3.0),
        ),
        hintText: "Ubicacion",
        hintStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(49, 150, 174, 1)),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget TipoPago() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 3.0),
        ),
        hintText: "Tipo de Pago",
        hintStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(49, 150, 174, 1)),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget boton() {
  return Container(
    child: MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.black)),
      minWidth: 10.0,
      height: 50.0,
      onPressed: () {},
      color: Color.fromRGBO(46, 44, 170, 1),
      child:
          Text('Agregar', style: TextStyle(color: Colors.white, fontSize: 20)),
    ),
  );
}
