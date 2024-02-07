// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Console extends StatefulWidget {
  const Console({super.key});

  @override
  State<Console> createState() => _ConsoleState();
}

class _ConsoleState extends State<Console> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = "";

  void _calcular() {
    double? alcool = double.tryParse(_controllerAlcool.text);
    double? gasolina = double.tryParse(_controllerGasolina.text);
    if (alcool == null || gasolina == null) {
      setState(() {
        _resultado = "Numero Inválido, digite números maiores que 0 e se (.)";
      });
    } else {
      setState(() {
        if (alcool / gasolina >= 0.7) {
          _resultado = "Melhor usar Gasolina";
        } else {
          _resultado = "Melhor usar Alcool";
        }
      });
      limparcampo();
    }
  }

  void limparcampo() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Água ou Gasolina",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Image.asset(
                "images/a_dot_burr.jpeg",
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Preço do Alcool, ex: 1.59",
                ),
                style: TextStyle(
                  fontSize: 14,
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Preço do Alcool, ex: 3.59",
                ),
                style: TextStyle(fontSize: 14),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: ElevatedButton(
                  onPressed: _calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  _resultado,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
