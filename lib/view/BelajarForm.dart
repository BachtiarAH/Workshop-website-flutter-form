import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BelajarForm extends StatefulWidget {
  const BelajarForm({super.key});

  @override
  State<BelajarForm> createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final keyForm = GlobalKey<FormState>();
  double nilaiSlider = 1;
  bool nilaiCheckbox = false;
  bool nilaiSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Belajar Form"),
        ),
        body: Form(
          key: keyForm,
          child: ListView(
            children: [
              //text fiel normal
              Container(
                margin: EdgeInsets.all(8),
                child: TextFormField(
                  autofocus: true,
                  decoration: new InputDecoration(
                    hintText: "Bachtiar Arya Habibie",
                    labelText: "Nama Lengkap",
                    icon: Icon(Icons.people),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),

              //acara 26

              //password
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "password",
                      icon: Icon(Icons.security),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'password tidak boleh kosong';
                    }
                    return null;
                  }),
                ),
              ),

              //checkboxlisttile
              CheckboxListTile(
                title: Text("Belajar Dasar Flutter"),
                subtitle: Text('Dart, widget, http'),
                value: nilaiCheckbox,
                activeColor: Colors.deepPurpleAccent,
                onChanged: (value) {
                  setState(() {
                    nilaiCheckbox = value!;
                  });
                },
              ),

              //switchlisttile
              SwitchListTile(
                title: Text('Backend Programing'),
                subtitle: Text('Dart, Nodejs, PHP, Java, dll'),
                value: nilaiSwitch,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    nilaiSwitch = value;
                  });
                },
              ),
              // Text(nilaiSlider.toString()),
              //slider
              Slider(
                min: 0,
                max: 100,
                value: nilaiSlider,
                onChanged: (value) {
                  setState(() {
                    nilaiSlider = value;
                  });
                },
              ),

              //button
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    onPressed: () {
                      if (keyForm.currentState!.validate()) {}
                    },
                    child: Text("submit")),
              ),
            ],
          ),
        ));
  }
}
