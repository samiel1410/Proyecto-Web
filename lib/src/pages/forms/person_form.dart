import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pagosapp_group/src/models/person_model.dart';
import 'package:pagosapp_group/services/person_service.dart';
import 'package:pagosapp_group/src/utils/standard_widgets.dart';

class PersonForm extends StatefulWidget {
  PersonForm({Key? key}) : super(key: key);

  @override
  _PersonFormState createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  final formKey = GlobalKey<FormState>();
  //DateTime _selectedDate = DateTime.now();
  PersonService _servicePerson = new PersonService();
  //Un objeto del modelo a enviar
  late Person _person;
  late File _image;
  bool _onSaving = false;
  bool _imageSelected = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _person = new Person.create("", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Standard.appBar(context, "Nuevo Usuario"),
        body: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Standard.getBackground(context),
              Container(
                margin: EdgeInsets.symmetric(vertical: 25.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        _showImage(),
                        Container(
                          width: 325.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Tooltip(
                                message: "Cámara",
                                child: ElevatedButton(
                                  onPressed: _takeImage,
                                  child: Icon(Icons.camera_alt),
                                  style: Standard.buttonStandardStyle(context),
                                ),
                              ),
                              Tooltip(
                                message: "Galería",
                                child: ElevatedButton(
                                  onPressed: _pickImage,
                                  child: Icon(Icons.image),
                                  style: Standard.buttonStandardStyle(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Standard.titleToForm(context, "Registrar"),
                    _form()
                  ],
                ),
              )
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
              children: [_inputName(), _inputBio(), _buttons()],
            ),
          )),
    ));
  }

  _inputName() {
    return TextFormField(
        initialValue: _person.name,
        onSaved: (value) {
          _person.name = value.toString();
        },
        validator: (value) {
          if (value!.length < 6) {
            return "El nombre de contener mínino 6 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Nombre"),
        maxLength: 35);
  }

  _inputBio() {
    return TextFormField(
        initialValue: _person.biography,
        onSaved: (value) {
          _person.biography = value.toString();
        },
        validator: (value) {
          if (value!.length < 10) {
            return "La biografía debe contener mínimo 10 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Biografía"),
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

    if (_imageSelected) {
      _person.photo = await _servicePerson.uploadImage(_image);
    }

    //Llamamos al servicio para guardar el reporte
    _servicePerson.sendPerson(_person).then((value) {
      formKey.currentState!.reset();
      Navigator.pop(context);
    });
  }

  _showImage() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Theme.of(context).canvasColor),
      child: ClipOval(
          child: _imageSelected == false
              ? Image.asset("assets/images/icono_user.png")
              : Image.file(_image)),
    );
  }

  _takeImage() {
    _selectImage(ImageSource.camera);
  }

  _pickImage() {
    _selectImage(ImageSource.gallery);
  }

  Future _selectImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);

    //image: DecorationImage(image: FileImage(File()))
    //final File file = File(pickedFile!.path);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _imageSelected = true;
      print('Imagen Selecionada con exito');
    } else {
      print('Imagen no selecionada');
      _imageSelected = false;
    }
    setState(() {});
  }
}
