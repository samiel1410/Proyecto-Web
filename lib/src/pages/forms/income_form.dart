import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:pagosapp_group/services/income_type_service.dart';

import 'package:pagosapp_group/src/models/income_model.dart';
import 'package:pagosapp_group/services/income_service.dart';
import 'package:pagosapp_group/src/models/income_type_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';

class IncomeForm extends StatefulWidget {
  IncomeForm({Key? key}) : super(key: key);

  @override
  _IncomeFormState createState() => _IncomeFormState();
}

class _IncomeFormState extends State<IncomeForm> {
  final formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  IncomeService _serviceIncome = new IncomeService();
  IncomeTypeService _serviceTypeIncome = new IncomeTypeService();
  List<IncomeType> _categories = [];
  late Income _income;

  bool _onSaving = false;

  @override
  void initState() {
    super.initState();
    _loadTypeIncome();
    _income = new Income.create("Ahorros", "", "", DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Standard.appBar(context, "Nuevo Ingreso"),
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
                  Standard.titleToForm(context, "Registro de Ingresos"),
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
                //_inputCategory(),
                _inputType(),
                _inputDescription(),
                _inputAmount(),
                _inputDate(),
                _buttons()
              ],
            ),
          )),
    ));
  }

  _inputType() {
    return DropdownButton<String>(
      value: _income.category,
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
          _income.category = newValue!;
        });
      },
      items: _categories.map<DropdownMenuItem<String>>((IncomeType value) {
        return DropdownMenuItem<String>(
          value: value.name,
          child: Text(value.name),
        );
      }).toList(),
    );
  }

  _inputCategory() {
    return TextFormField(
        initialValue: _income.category,
        onSaved: (value) {
          _income.category = value.toString();
        },
        validator: (value) {
          if (value!.length < 3) {
            return "El nombre de contener mínino 3 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Categoria"),
        maxLength: 35);
  }

  _inputDescription() {
    return TextFormField(
        initialValue: _income.description,
        onSaved: (value) {
          _income.description = value.toString();
        },
        validator: (value) {
          if (value!.length < 10) {
            return "La biografía debe contener mínimo 10 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Descripcion"),
        maxLength: 35);
  }

  _inputAmount() {
    return TextFormField(
        initialValue: _income.amount,
        onSaved: (value) {
          _income.amount = value.toString();
        },
        validator: (value) {
          if (value!.length < 1) {
            return "La biografía debe contener mínimo 1 caracter";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Cantidad"),
        maxLength: 35);
  }

  _inputDate() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fecha de ingreso ",
              style: Theme.of(context).textTheme.subtitle1),
          DatePickerWidget(
            lastDate: DateTime.now(),
            looping: false, // default is not looping
            dateFormat: "dd-MMMM-yyyy",
            locale: DatePicker.localeFromString('es'),
            onChange: (DateTime newDate, _) {
              _selectedDate = newDate;
              _income.date = _selectedDate;
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
    _serviceIncome.sendIncome(_income).then((value) {
      formKey.currentState!.reset();
      Navigator.pop(context);
    });
  }

  _loadTypeIncome() {
    _serviceTypeIncome.getTypes().then((value) {
      _categories = value;
      setState(() {});
    });
  }
}
