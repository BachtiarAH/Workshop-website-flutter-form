import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> agama = [
    "Islam",
    "Kristen Protestan",
    "Kristen Katolik",
    "Hindu",
    "Budha",
  ];

  String _agama = "Islam";
  String _jk = "";

  //controller
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerMoto = new TextEditingController();

  //fungsi memilih jenis kelamin
  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  //fungsi pilih agaman
  void _pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  //fungsid kirim data
  void kirimdata() {
    // ignore: unnecessary_new
    AlertDialog alertDialog = new AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          children: [
            Text("Nama Lengkap : ${controllerNama.text}"),
            Text("Password : ${controllerPass.text}"),
            Text("Moto Hidup : ${controllerMoto.text}"),
            Text("Jenis Kelamin : ${_jk}"),
            Text("Agama : ${_agama}"),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("ok"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            )
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      builder: (context) => alertDialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text("Data diri"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                //nama lengkap
                TextField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                      hintText: "Nama Lengkap",
                      labelText: "Nama Lengkap",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),

                Padding(padding: EdgeInsets.only(top: 20)),

                //password
                TextField(
                  controller: controllerPass,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),

                Padding(padding: EdgeInsets.only(top: 20)),

                //moto hidup
                TextField(
                  controller: controllerMoto,
                  decoration: InputDecoration(
                      hintText: "Moto Hidup",
                      labelText: "Moto Hidup",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),

                Padding(padding: EdgeInsets.only(top: 20)),

                RadioListTile(
                  title: Text("laki-laki"),
                  value: "laki-laki",
                  groupValue: _jk,
                  onChanged: (value) {
                    _pilihJk(value!);
                  },
                  activeColor: Colors.blue,
                  subtitle: Text("Pilih ini jika anda laki-laki"),
                ),
                RadioListTile(
                  title: Text("perempuan"),
                  value: "perempuan",
                  groupValue: _jk,
                  onChanged: (value) {
                    _pilihJk(value!);
                  },
                  activeColor: Colors.blue,
                  subtitle: Text("Pilih ini jika anda perempuan"),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),

                //agama
                Row(
                  children: [
                    Text(
                      "Agama ",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    Padding(padding: EdgeInsets.only(left: 15)),
                    DropdownButton(
                        onChanged: (String? value) {
                          _pilihAgama(value!);
                        },
                        value: _agama,
                        items: agama.map((String? value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value!),
                          );
                        }).toList())
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      kirimdata();
                    },
                    child: Text("OK"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
