import 'package:anotafacil/model/BancoDeDados.dart';
import 'package:anotafacil/model/Nota.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget VerificaNotas(){
   AnotaDao dao=AnotaDao();
    if(dao.Buscatudo()==null){
           return Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Center(                 
                 child:Text("Nenhuma anotação adionada")
               ),
             ],
           );         
   }
  

  
  else{    
    return FutureBuilder<List<Nota>>(
            future: dao.Buscatudo(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  //return Progress();
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                if(snapshot.hasData){
                  final List<Nota> dado = snapshot.data;
                  if (dado.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          children: List.generate(dado.length, (index) {
                            
                        return constroiNota(dado[index]);
                      })),
                    );
                  }

                }
                  
                  return Center(child: Text("Nenhum Agendamento Feito"));

                  break;
              }
              return Center(child: Text("Erro"));
            }
            );
}
   
            
  

  // Column montaAgendamentos(DadosSalvos itemlista) {
  //   return controiAgendamentos(itemlista);

    
  // }

  
  

}


Column constroiNota(Nota dados) {
    if(dados.title==""){
      return Column(
        children: <Widget>[
          Center(child: Text("Nenhum Agendamento Feito")),
        ],
      );
    }
    else{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border:Border(bottom: BorderSide(color: Colors.black))
            ),
            child: Text("${dados.title}",style:TextStyle(fontWeight: FontWeight.w900,fontSize: 18))),
        ),
        Container(
          
          width: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            
            child: Text(
                "${dados.message}",
                style: TextStyle(fontSize: 16)),
          ),
        ),
      ],
    );
    }
  }