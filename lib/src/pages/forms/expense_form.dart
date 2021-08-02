
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pagosapp_group/services/expense_service.dart';
import 'package:pagosapp_group/services/expense_type_service.dart';

import 'dart:io';

import 'package:pagosapp_group/src/models/expense_model.dart';
import 'package:pagosapp_group/src/models/expense_type_model.dart';



import 'package:pagosapp_group/src/utils/standard_widgets.dart';


//import 'package:provider/provider.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({Key? key}) : super(key: key);
  
  

  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  //Clave para vincular el Formulario (Form)
  final formKey = GlobalKey<FormState>();

 
  ExpenseTypeService _serviceCategori = new ExpenseTypeService();
  
  ExpenseService _expenseService = new ExpenseService();

  List<ExpenseType> _categoris = [];
  DateTime _selectedDate = DateTime.now();
  bool _bolean = true;
   late File _image;
   bool _imageSelected = false;
  final ImagePicker _picker = ImagePicker();
  int _amount = 0;
  //Un objeto del modelo a enviar
  late Expense _expense= Expense.create("Casa","",_amount,_selectedDate,"","");
  
  
 
  bool _onSaving = false;
  

  @override
  void initState() {
    super.initState();
    
    _loadTypeIncome();
 
    
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
                  SizedBox(height: 40.0),
                  
                  ClipOval(
                    
                      child: Image.asset("assets/images/" +
                        Standard.getFisioImage(_expense.categori) +
                        ".png")
                    
                  ),
                  Standard.titleToForm2(context, "Registro de Gasto"),
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
                
                SizedBox(height: 10),
                _categori(),
                SizedBox(height: 10),
                _description(),
                SizedBox(height: 10),
                _monto(),
                SizedBox(height: 10),
                _imageSelected == true
                 ? _showImage()
                 :_photo(),
                _dateOfPage(),
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


_description() {
  return TextFormField(
     initialValue: _expense.description,
    onSaved: (value) {
      //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
      _expense.description = value.toString();
    },
    validator: (value) {
      if (value!.length < 10) {
        return "Debe ingresar un mensaje con al menos 10 caracteres";
      } else {
        return null; //Validación se cumple al retorna null
      }
    },
      enabled: _bolean,
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


_monto() {
  return TextFormField(
    initialValue: _amount.toString(),
    onSaved: (value) {
      //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
      _expense.amount = int.tryParse(value!)!;
    },
  
    validator: (value) {
      if (value!.length < 1) {
        return "Debe ingresar un mensaje con al menos 1 caracteres";
      } else {
        return null; //Validación se cumple al retorna null
      }
    },
      enabled: _bolean,
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

_dateOfPage() {
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
              _expense.date = _selectedDate;
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
      initialValue: _expense.address,
    onSaved: (value) {
      //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
      _expense.address = value.toString();
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

_categori() {
  return  DropdownButton<String>(
      
      value: _expense.categori,
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
          _expense.categori = newValue!;
          _expense.image = Standard.getFisioImage(newValue);
        });
      },
      items: _categoris.map<DropdownMenuItem<String>>((ExpenseType value) {
        return DropdownMenuItem<String>(
          value: value.name,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
_photo(){
  return Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                              height: 170,
                            
                            decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                      
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Tooltip(
                                message: "Tomar foto",
                                child: ElevatedButton(
                                  onPressed: _takeImage,
                                  child: Icon(Icons.camera_alt,  color: Colors.black45,),
                                  style: Standard.buttonStandardStyle(context),
                                ),
                              ),
                              Tooltip(
                                message: "Buscar foto",
                                child: ElevatedButton(
                                  onPressed: _pickImage,
                                  child: Icon(Icons.image),
                                  style: Standard.buttonStandardStyle(context),
                                ),
                              ),
                            ],
                          ),
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
               
              },
              child: Icon(Icons.save),
              style: Standard.buttonStandardStyle(context),
            ),
          );
  }

   _sendForm() async {
    if (!formKey.currentState!.validate()) return;
    _onSaving = true;
    setState(() {});
    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState!.save();

    if (!formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
    if (_imageSelected) {
      _expense.photo = await _expenseService.uploadImage(_image);
    }
    //Llamamos al servicio para guardar el reporte
    _expenseService.sendExpense(_expense).then((value) {
      formKey.currentState!.reset();
      _onSaving = false;
      Navigator.pop(context);
    });
  }

   _takeImage() {
    _selectImage(ImageSource.camera);
  }

  _pickImage() {
    _selectImage(ImageSource.gallery);
  }

  Future _selectImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _imageSelected = true;
    } else {
      print('No image selected.');
      _imageSelected = false;
    }
    setState(() {});
  }
   _showImage() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Theme.of(context).canvasColor),
      child: 
          _imageSelected == false
              ? Container()
              : Image.file(_image),
    );
  }


   _loadTypeIncome() {
    _serviceCategori.getTypes().then((value) {
      _categoris = value;
      setState(() {});
    });
  }
}
