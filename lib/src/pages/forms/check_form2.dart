import 'package:flutter/material.dart';
import 'package:pagosapp_group/services/check_service.dart';
import 'package:pagosapp_group/src/models/check_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';

//import 'package:provider/provider.dart';

class CheckForm2 extends StatefulWidget {
  const CheckForm2({Key? key}) : super(key: key);

  @override
  _CheckForm2State createState() => _CheckForm2State();
}

class _CheckForm2State extends State<CheckForm2> {
  //Clave para vincular el Formulario (Form)
  final formKey = GlobalKey<FormState>();

  CheckService _serviceCheck = new CheckService();
  //bool _bolean = true;

  //Un objeto del modelo a enviar
  late Check _check;

  bool _onSaving = false;

  @override
  void initState() {
    super.initState();
    _check = Check.create("", "", "", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Standard.appBar(context, "Nuevo Cheque"),
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
                    child: Image.asset("assets/images/cheque.png"),
                  ),
                  Standard.titleToForm(context, "Registro de Cheque"),
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
                      _inputBankInstitution(),
                      _inputNumberCheck(),
                      _inputOwnerCheck(),
                      _inputCheckIdentification(),
                      _boton()
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  _inputBankInstitution() {
    return TextFormField(
        initialValue: _check.bankinInstitution,
        onSaved: (value) {
          _check.bankinInstitution = value.toString();
        },
        validator: (value) {
          if (value!.length < 6) {
            return "De contener mínino 6 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Institución bancaria"),
        maxLength: 35);
  }

  _inputNumberCheck() {
    return TextFormField(
        initialValue: _check.numberCheck,
        onSaved: (value) {
          _check.numberCheck = value.toString();
        },
        validator: (value) {
          if (value!.length < 2) {
            return "Debe contener al menos  2 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Numero de cheques"),
        maxLength: 35);
  }

  _inputOwnerCheck() {
    return TextFormField(
        initialValue: _check.ownerName,
        onSaved: (value) {
          _check.ownerName = value.toString();
        },
        validator: (value) {
          if (value!.length < 10) {
            return "Debe contener solo 10 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Propietario del cheque"),
        maxLength: 35);
  }

  _inputCheckIdentification() {
    return TextFormField(
        initialValue: _check.checkIdentification,
        onSaved: (value) {
          _check.checkIdentification = value.toString();
        },
        validator: (value) {
          if (value!.length != 10) {
            return "Debe contener 10 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Identificación del cheque"),
        maxLength: 35);
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
    _serviceCheck.sendCheck(_check).then((value) {
      formKey.currentState!.reset();
      Navigator.pop(context);
    });
  }
}
