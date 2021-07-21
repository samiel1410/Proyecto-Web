import 'package:flutter/material.dart';

import 'package:pagosapp_group/services/check_service.dart';
import 'package:pagosapp_group/src/models/check_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';

class ChequeForm extends StatefulWidget {
  ChequeForm({Key? key}) : super(key: key);

  @override
  _ChequeFormState createState() => _ChequeFormState();
}

class _ChequeFormState extends State<ChequeForm> {
  final formKey = GlobalKey<FormState>();
  //DateTime _selectedDate = DateTime.now();
  CheckService _serviceCheque = new CheckService();
  //Un objeto del modelo a enviar
  late Check _cheque;

  bool _onSaving = false;

  @override
  void initState() {
    super.initState();
    _cheque = new Check.create("", "", "", "");
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
              ),
            ],
          ),
        ));
  }

  _form() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      width: size.width * .85,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Theme.of(context).dividerColor)),
      child: Form(
          key: formKey,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 7.0),
            child: Column(
              children: [
                _inputBankInstitution(),
                _inputNumberCheck(),
                _inputOwnerCheck(),
                _inputCheckIdentification(),
                _buttons()
              ],
            ),
          )),
    ));
  }

  _inputBankInstitution() {
    return TextFormField(
        initialValue: _cheque.bankinInstitution,
        onSaved: (value) {
          _cheque.bankinInstitution = value.toString();
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
        initialValue: _cheque.numberCheck,
        onSaved: (value) {
          _cheque.numberCheck = value.toString();
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
        initialValue: _cheque.ownerName,
        onSaved: (value) {
          _cheque.ownerName = value.toString();
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
        initialValue: _cheque.checkIdentification,
        onSaved: (value) {
          _cheque.checkIdentification = value.toString();
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

  _buttons() {
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
    _serviceCheque.sendCheck(_cheque).then((value) {
      formKey.currentState!.reset();
      Navigator.pop(context);
    });
  }
}
