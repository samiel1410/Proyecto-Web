import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:pagosapp_group/src/pages/main_page.dart';
import 'package:intl/intl.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';

//import 'package:provider/provider.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({Key? key, required this.idperson}) : super(key: key);
  final String idperson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            onPressed: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainPage()))
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Standard.getBackground(context),
              Column(
                children: [
                  SizedBox(height: 40.0),
                  ClipOval(
                      child: Image.asset(
                    'assets/images/icono_pago.png',
                    height: 100,
                  )),
                  Standard.TitleToForm(context, "Registro Pago"),
                  _form(context)
                ],
              )
            ],
          ),
        ));
  }
}

_form(context) {
  final size = MediaQuery.of(context).size;
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          width: size.width * .90,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Theme.of(context).dividerColor)),
          child: Form(
              //key: formKey,
              child: Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5.0),
            child: Column(
              children: [
                user(context),
                SizedBox(height: 10),
                descripcion(context),
                SizedBox(height: 10),
                monto(context),
                SizedBox(height: 10),
                inputBirth(context),
                SizedBox(height: 10),
                ubicacion(context),
                SizedBox(height: 10),
                tipoPago(context),
                SizedBox(height: 10),
                boton(context)
              ],
            ),
          )),
        )
      ],
    ),
  );
}

Widget user(context) {
  return TextFormField(
    //  initialValue: _treatment.diagnostic,
    onSaved: (value) {
      //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
      //_treatment.diagnostic = value.toString();
    },
    validator: (value) {
      if (value!.length < 10) {
        return "Debe ingresar un mensaje con al menos 10 caracteres";
      } else {
        return null; //Validación se cumple al retorna null
      }
    },
    decoration: InputDecoration(
      labelText: "Nombre",
      suffixIcon: Icon(Icons.add_comment_outlined),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).accentColor, width: 3.0),
      ),
    ),
  );
}

Widget descripcion(context) {
  return TextFormField(
    //  initialValue: _treatment.diagnostic,
    onSaved: (value) {
      //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
      //_treatment.diagnostic = value.toString();
    },
    validator: (value) {
      if (value!.length < 10) {
        return "Debe ingresar un mensaje con al menos 10 caracteres";
      } else {
        return null; //Validación se cumple al retorna null
      }
    },
    decoration: InputDecoration(
      labelText: "Descripcion",
      suffixIcon: Icon(Icons.add_comment_outlined),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).accentColor, width: 3.0),
      ),
    ),
  );
}

Widget monto(context) {
  return TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.attach_money),
      labelText: "Monto",
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).accentColor, width: 3.0),
      ),
    ),
  );
}

Widget inputBirth(context) {
  return DateTimeField(
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.date_range),
      labelText: "Fecha",
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).accentColor, width: 3.0),
      ),
    ),
    format: DateFormat("dd/MMM/yyyy"),
    onShowPicker: (context, currentValue) {
      return showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime(2100));
    },
  );
}

Widget ubicacion(context) {
  return TextFormField(
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.where_to_vote_outlined),
      labelText: "Ubicacion",
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).accentColor, width: 3.0),
      ),
    ),
  );
}

Widget tipoPago(context) {
  return TextFormField(
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.vignette_outlined),
      labelText: "Tipo de Pago",
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).accentColor, width: 3.0),
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
      minWidth: 10.0,
      height: 50.0,
      onPressed: () {},
      color: Theme.of(context).accentColor,
      child: Text('Agregar',
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.bold)),
    ),
  );
}
