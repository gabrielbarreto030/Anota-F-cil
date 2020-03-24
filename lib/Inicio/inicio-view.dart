

import 'package:anotafacil/Anotar/anotar-view.dart';
import 'package:anotafacil/Inicio/inicio-controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Inicio extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _inicio();
  }

}

class _inicio extends State<Inicio>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(title: Text("Anotações")),
      body: Column(children: <Widget>[
         VerificaNotas()
      ],),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Anotar()));
        // Add your onPressed code here!
      },
      child: Icon(Icons.edit),
      backgroundColor: Colors.blue,
    ),
    );
  }

}



