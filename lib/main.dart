import 'package:anotafacil/Inicio/inicio-view.dart';
import 'package:anotafacil/Loading/loading-view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(       
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        '/Inicio': (BuildContext context) => Inicio()
      },
    );
  }
}



