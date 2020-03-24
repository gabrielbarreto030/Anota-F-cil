


import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Nota.dart';

Future<Database> CreateDabase() async{
  final String path=join(await getDatabasesPath(),"anotafacil.db");
  return openDatabase(path,onCreate: (db,version){
       db.execute(AnotaDao.tablesql);
     },version: 1,
     );


}


class AnotaDao {
  static const String tablesql = "CREATE TABLE $tablename("
      "${_id} INTEGER PRIMARY KEY, "
      "${_title} TEXT, "
      "${_nota} TEXT"
      ") ";
  static const String tablename = "listadenotas";
  static const String _id = "id";
  static const String _title = "title";
  static const String _nota = "nota";

  Future<int> Salva(Nota item) async {
    final Database db = await CreateDabase();
    Map<String, dynamic> Mapitem = ToMap(item);
    return db.insert(tablename, Mapitem);
  }

  Map<String, dynamic> ToMap(Nota item) {
    final Map<String, dynamic> Mapitem = Map();
    Mapitem[_title] = item.title;
    Mapitem[_nota] = item.message;
    return Mapitem;
  }

  Future<List<Nota>> Buscatudo() async {
    final Database db = await CreateDabase();
    final List<Map<String, dynamic>> result = await db.query(tablename);
    List<Nota> itemlistado = ToList(result);
    return itemlistado;
  }

  List<Nota> ToList(List<Map<String, dynamic>> result) {
    final List<Nota> itemlistado = List();
    for (Map<String, dynamic> row in result) {
      final Nota item =
          Nota(row[_title], row[_nota]);
      itemlistado.add(item);
    }
    return itemlistado;
  }
}



