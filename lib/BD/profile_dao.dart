import 'dart:developer';

import 'package:gym_app/BD/db_helper.dart';
import 'package:gym_app/Classes/profile_info.dart';

class ProfileDAO {
  static Future<void> inserir(int id, double weight) async {
    var db = await DBHelper.getInstance();

    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    Map<String, String> value = {
      'p_id': id.toString(),
      'w1': weight.toString(),
      'data': date.toString()
    };
    await db.insert(
      'weights_list',
      value,
    );
  }

  static Future<List<ProfileInfo>> carregarPesos() async {
    var db = await DBHelper.getInstance();
    List<Map<String, Object?>> resultado = await db.query('weights_list');
    List<ProfileInfo> profile =
        resultado.map((mapProfile) => ProfileInfo.fromMap(mapProfile)).toList();
    return profile;
  }

  static Future<List<ProfileInfo>> printarPesos() async {
    var db = await DBHelper.getInstance();
    List<Map<String, Object?>> resultado = await db.query('weights_list');
    List<ProfileInfo> profile =
        resultado.map((mapProfile) => ProfileInfo.fromMap(mapProfile)).toList();
    for (var issoai in profile) {
      log(issoai.weight);
    }
    return profile;
  }
}
