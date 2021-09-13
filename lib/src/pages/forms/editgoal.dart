import 'package:flutter/material.dart';
import 'package:pagosapp_group/providers/goal_elements.dart';
import 'package:pagosapp_group/src/models/goal_model.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';
import 'package:provider/provider.dart';

class GoalElementForm extends StatefulWidget {
  GoalElementForm({Key? key}) : super(key: key);

  @override
  _GoalElementFormState createState() => _GoalElementFormState();
}

class _GoalElementFormState extends State<GoalElementForm> {
//Clave para vincular el Formulario (Form)

  final formKey = GlobalKey<FormState>();

  //Un objeto del modelo a enviar
 
  bool _onSaving = false;
  double _credit = 0;
  late Goal _element = Goal.create("",_credit);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children:[ 
           Standard.getBackground(context),
          Column(
           
          children: [
           
             SizedBox(height: 40.0),
              Standard.titleToForm2(context, "Registro de Meta"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: size.width * .80,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Theme.of(context).dividerColor)),
              child: Form(
                  key: formKey,
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 32.0, horizontal: 14.0),
                    child: Column(
                      
                      children: [_inputName(), _inputAmount(), _buttons()],
                    ),
                    
                  )),
            ),
              
          ],
        ),
        ]),
    );
  }

  _inputName() {
    return TextFormField(
        initialValue: _element.name,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _element.name = value.toString();
        },
        validator: (value) {
          if (value!.length < 10) {
            return "Debe ingresar una descripción con al menos 10 caracteres";
          } else {
            return null; //Validación se cumple al retorna null
          }
        },
        decoration: InputDecoration(labelText: "Nombre", suffixIcon: Icon(Icons.add_comment_outlined),),
        maxLength: 20,
       );
  }

 _inputAmount() {
    return TextFormField(
        initialValue: _credit.toString(),
        onSaved: (value) {
          _element.credit = double.tryParse(value!)!;
        },
        validator: (value) {
          if (value!.length < 1) {
            return "La cantidad debe ser al menos uno";
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: "Cantidad",
        suffixIcon: Icon(Icons.attach_money),),
        maxLength: 8);
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
              },
              child: Icon(Icons.save),
              style: Standard.buttonStandardStyle(context),
            ),
          );
  }

  _sendForm() {
    if (!formKey.currentState!.validate()) return;
    _onSaving = true;
    setState(() {});

    formKey.currentState!.save();

    final fisioProvider =
        Provider.of<GoalElementProvider>(context, listen: false);
    fisioProvider.addElement(_element.name, _element.credit).then((value) {
      _element = value;
      formKey.currentState!.reset();
      _onSaving = false;
      setState(() {});
    });
  }
}
