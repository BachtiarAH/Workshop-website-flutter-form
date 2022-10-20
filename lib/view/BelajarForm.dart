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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Form"),
      ),
      body: Form(
        key: keyForm,
        child:  ListView(
        children: [
          //text fiel normal
          Container(
            margin: EdgeInsets.only(top: 10),
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
          //button
          Container(
            margin: EdgeInsets.only(top: 10),
            child: ElevatedButton(onPressed: () {
              if (keyForm.currentState!.validate()) {                
              }
            }, child: Text("submit")),
          )
        ],
      ),
        )
     
    );
  }
}
