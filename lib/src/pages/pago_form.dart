
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:pagosapp_group/services/card_service.dart';
import 'package:pagosapp_group/services/payment_service.dart';
import 'package:pagosapp_group/services/payment_type_service.dart';
import 'package:pagosapp_group/src/models/payment_model.dart';
import 'package:pagosapp_group/src/models/payment_type_model.dart';
import 'package:pagosapp_group/src/models/tarjeta_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';


//import 'package:provider/provider.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({Key? key, required this.idperson}) : super(key: key);
  final String idperson;
  

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  //Clave para vincular el Formulario (Form)
  final formKey = GlobalKey<FormState>();

  PaymentTypeService _serviceTypePayment= new PaymentTypeService();
  PaymentService _servicePayment = new PaymentService();
  CardService _cardService = new CardService();
  List<PaymentType> _types = [];
  List<Tarjeta> _cards = [];
  DateTime _selectedDate = DateTime.now();
  List<Widget> _unidos=[];

  //Un objeto del modelo a enviar
  late Payment _payment;
 
  bool _onSaving = false;

  @override
  void initState() {
    super.initState();
    _loadTypePayments();
    _loadCards();
 
    _payment = Payment.create(
        "", "", "",widget.idperson, _selectedDate, "" , "Efectivo");
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Standard.appBar(context, "Nuevo Pago"),
        body: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Standard.getBackground(context),
              Column(
                children: [
                  SizedBox(height: 35.0),
                  SizedBox(
                    height: 120.0,
                    child: Image.asset("assets/images/" +
                        Standard.getFisioImage(_payment.typePage) +
                        ".png"),
                  ),
                  Standard.titleToForm(context, "Registro de Pago"),
                  _form()
                ],
              )
            ],
          ),
        ));
  }
  _form() {
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
              key: formKey,
              child: Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5.0),
            child: Column(
              children: [
                  _tipoPago(),
                   SizedBox(height: 10),
                _user(),
                SizedBox(height: 10),
                _descripcion(),
                SizedBox(height: 10),
          
                _payment.typePage == "Tarjeta" ?
                _monto() 
                : _monto(),
                SizedBox(height: 10),
                _inputBirth(),
                SizedBox(height: 10),
                _ubicacion(),
               
        
                SizedBox(height: 10),
                _boton()
              ],
            ),
          )),
        )
      ],
    ),
  );
}

_user() {
  return TextFormField(
    initialValue: _payment.title,
    onSaved: (value) {
      //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
      _payment.title = value.toString();
    },
    validator: (value) {
      if (value!.length < 5) {
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

_descripcion() {
  return TextFormField(
     initialValue: _payment.description,
    onSaved: (value) {
      //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
      _payment.description = value.toString();
    },
    validator: (value) {
      if (value!.length < 15) {
        return "Debe ingresar un mensaje con al menos 15 caracteres";
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

_monto1(){
  return TextFormField(
    initialValue: _payment.amount,
    onSaved: (value) {
      //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
      _payment.amount = value.toString();
    },
  
   
    validator: (value) {
      if (value!.length < 1) {
        return "Debe ingresar un mensaje con al menos 1 caracteres";
      } else {
        return null; //Validación se cumple al retorna null
      }
    },
    
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
    ),);

}
_monto() {
  return _payment.typePage == "Efectivo"
    ?TextFormField(
    initialValue: _payment.amount,
    onSaved: (value) {
      //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
      _payment.amount = value.toString();
    },
  
    validator: (value) {
      if (value!.length < 1) {
        return "Debe ingresar un mensaje con al menos 1 caracteres";
      } else {
        return null; //Validación se cumple al retorna null
      }
    },
    
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
  )
    : _payment.typePage == "Tarjeta"?
     DropdownButton<String>(

      value: _cards[1].name,
      icon: const Icon(Icons.expand_more),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      underline: Container(
        height: 2,
        color: Theme.of(context).dividerColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          
          _payment.typePage = newValue!;
        });
      },
      
      items: _cards.map<DropdownMenuItem<String>>((Tarjeta value) {
        return DropdownMenuItem<String>(
          value: value.name,
          child: Text(value.name),
        );
      }).toList(),
    )
  :TextFormField(
    initialValue: _payment.amount,
    onSaved: (value) {
      //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
      _payment.amount = value.toString();
    },
  
   
    validator: (value) {
      if (value!.length < 1) {
        return "Debe ingresar un mensaje con al menos 1 caracteres";
      } else {
        return null; //Validación se cumple al retorna null
      }
    },
    
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
    ),);
}


_inputBirth() {
  return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fecha de inicio", style: Theme.of(context).textTheme.subtitle1),
          DatePickerWidget(
            looping: false, // default is not looping
            dateFormat: "dd-MMMM-yyyy",
            locale: DatePicker.localeFromString('es'),
            onChange: (DateTime newDate, _) {
              _selectedDate = newDate;
              _payment.date = _selectedDate;
            },
            pickerTheme: DateTimePickerTheme(
              backgroundColor: Theme.of(context).canvasColor,
              itemTextStyle: TextStyle(color: Theme.of(context).primaryColor),
              dividerColor: Theme.of(context).disabledColor,
            ),
          )
        ],
      ),
    );
  }

_ubicacion() {
  return TextFormField(
      initialValue: _payment.address,
    onSaved: (value) {
      //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
      _payment.address = value.toString();
    },
    validator: (value) {
      if (value!.length < 5) {
        return "Debe ingresar un mensaje con al menos 5 caracteres";
      } else {
        return null; //Validación se cumple al retorna null
      }
    },
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

_tipoPago() {
  return  DropdownButton<String>(
      
      value: _payment.typePage,
      icon: const Icon(Icons.expand_more),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      underline: Container(
        height: 2,
        color: Theme.of(context).dividerColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          _payment.typePage = newValue!;
      
        });
      },
      items: _types.map<DropdownMenuItem<String>>((PaymentType value) {
        return DropdownMenuItem<String>(
          
          value: value.name,
        
          child: Text(value.name),
        );
      }).toList(),
    );
  }

_boton() {
  return _onSaving
        ? Container(
            height: 50.0,
            width: 50.0,
            child: Center(child: CircularProgressIndicator()))
        : Tooltip(
            message: "Guardar",
            child: ElevatedButton(
              onPressed: () {
                _sendForm();
                _onSaving = true;
                setState(() {});
              },
              child: Icon(Icons.save),
              style: Standard.buttonStandardStyle(context),
            ),
          );
  }

   _sendForm() async {
    if (!formKey.currentState!.validate()) return;

    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState!.save();

    //Llamamos al servicio para guardar el reporte
    _servicePayment.sendPayment(_payment).then((value) {
      formKey.currentState!.reset();
      Navigator.pop(context);
    });
  }

  _loadTypePayments() {
    _serviceTypePayment.getTypes().then((value) {
      _types = value;
      setState(() {});
    });
  }

   _loadCards() {
    _cardService.getCard(widget.idperson).then((value) {
      _cards = value;
      setState(() {});
    });
  }

}
