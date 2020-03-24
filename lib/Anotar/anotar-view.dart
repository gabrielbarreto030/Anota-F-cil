import 'package:anotafacil/Inicio/inicio-view.dart';
import 'package:anotafacil/model/BancoDeDados.dart';
import 'package:anotafacil/model/Nota.dart';
import 'package:flutter/material.dart';

class Anotar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Anotar();
  }
}

class _Anotar extends State<Anotar> {
  Nota anota=Nota("","");
  String titleText;
  String messageText;
  final AnotaDao dao=AnotaDao();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Anotação")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  TextField(
                    onChanged: (text){anota.title=text;},
                    decoration: InputDecoration(labelText: 'Título')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text){ anota.message=text;},
                minLines: 15,
                maxLines: 20,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Anote Aqui!!!"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                padding: const EdgeInsets.all(30),
                onPressed: () {
                   debugPrint(anota.title);
                   dao.Salva(Nota(anota.title,anota.message));
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Inicio()));
                },
                child: Text("Salvar"),
                color: Colors.blue,
              ),
            )
          ]),
        ));
  }
}
