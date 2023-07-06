import 'dart:developer';

import 'package:gym_app/BD/db_helper.dart';
import 'package:gym_app/BD/dio_client.dart';
import 'package:gym_app/Classes/exercicio_class.dart';
import 'package:sqflite/sqflite.dart';

class ExerciseDAO {
  static Future<void> insert() async {
    var exerc = await DioClient.getExercises();
    int i = 0;
    var db = await DBHelper.getInstance();
    for (var element in exerc) {
      await db.insert(
        'exercises',
        element.toMap(),
      );
      i++;
    }
    log(i.toString());
  }

  static Future<List<Exercise>> loadExercises() async {
    var db = await DBHelper.getInstance();
    List<Map<String, Object?>> resultado = await db.query('exercises');
    List<Exercise> exercicios = resultado
        .map((mapExercicio) => Exercise.fromMap(mapExercicio))
        .toList();
    return exercicios;
  }

  static Future<List<Exercise>> loadExercisesByBP(String bodyPart) async {
    var db = await DBHelper.getInstance();
    List<Map<String, Object?>> resultado = await db
        .rawQuery('SELECT *FROM exercises WHERE bodyPart = ?', [bodyPart]);
    List<Exercise> exercicios = resultado
        .map((mapExercicio) => Exercise.fromMap(mapExercicio))
        .toList();
    return exercicios;
  }

  static Future<List<Exercise>> loadExercisesByID(String id) async {
    var db = await DBHelper.getInstance();
    List<Map<String, Object?>> resultado =
        await db.rawQuery('SELECT *FROM exercises WHERE id = ?', [id]);
    List<Exercise> exercicio = resultado
        .map((mapExercicio) => Exercise.fromMap(mapExercicio))
        .toList();
    return exercicio;
  }

  static Future<List<Exercise>> loadExercisesByName(String nome) async {
    var db = await DBHelper.getInstance();
    List<Map<String, Object?>> resultado =
        await db.rawQuery('SELECT *FROM exercises WHERE name = ?', [nome]);
    List<Exercise> exercicio = resultado
        .map((mapExercicio) => Exercise.fromMap(mapExercicio))
        .toList();
    return exercicio;
  }

  static Future<void> delete() async {
    var db = await DBHelper.getInstance();
    await db.delete('exercises');
  }

  static Future<int> getCountByBodyPart(String bodyPart) async {
    var db = await DBHelper.getInstance();
    var result = await db.rawQuery(
        'SELECT COUNT(*) FROM exercises WHERE bodyPart = ?', [bodyPart]);
    var count = Sqflite.firstIntValue(result);
    return count ?? 0;
  }

  static Future<void> uptadeExercises() async {
    int quantidadeAtual = await ExerciseDAO.getCountByBodyPart('');

    List<Exercise> exerciciosAPI = await DioClient.getExercises();

    if (quantidadeAtual != exerciciosAPI.length) {
      await ExerciseDAO.delete();
      await ExerciseDAO.insert();
    }
  }
}
