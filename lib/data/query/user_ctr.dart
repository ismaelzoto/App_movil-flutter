import 'package:itca/models/user.dart';
import 'dart:async';
import 'package:itca/data/database_helper.dart';

class UserCtr {
DatabaseHelper con = new DatabaseHelper();

//insertion
  Future<int> saveUser(User user) async {
    var dbClient = await con.db;
    int res = await dbClient.insert("User", user.toMap());
    print('[DBHelper] almacena_Usuario: con Éxito | $user');
    return res;
  }

  //deletion
  Future<int> deleteUser(int user) async {
    var dbClient = await con.db;
    int res = await dbClient.rawDelete('DELETE FROM User WHERE id = ?', [user]);
    print('[DBHelper] Elimina_Usuario: con Éxito | $user');
    return res;
  }

  Future<User> checkUser(String user, String password) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery("SELECT * FROM user WHERE username = '$user' and password = '$password'");
    
    if (res.length > 0) {
      return new User.fromMap(res.first);
    }
    return null;
  }

  Future<List<User>> getAllUser() async {
    var dbClient = await con.db;
    var res = await dbClient.query("user");
    
    List<User> list =
        res.isNotEmpty ? res.map((c) => User.fromMap(c)).toList() : null;
    return list;
  }
}