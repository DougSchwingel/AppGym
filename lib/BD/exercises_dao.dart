import 'dart:developer';

import 'package:gym_app/BD/db_helper.dart';
import 'package:gym_app/BD/dio_client.dart';
import 'package:gym_app/Classes/exercicio_classe.dart';
import 'package:sqflite/sqflite.dart';

class ExerciseDAO {
  static Future<void> inserir() async {
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

  static Future<List<Exercicio>> carregarExercicios() async {
    var db = await DBHelper.getInstance();
    List<Map<String, Object?>> resultado = await db.query('exercises');
    List<Exercicio> exercicios = resultado
        .map((mapExercicio) => Exercicio.fromMap(mapExercicio))
        .toList();
    return exercicios;
  }

  static Future<void> deletar() async {
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

  static Future<void> verificarAtualizarExercicios() async {
    int quantidadeAtual = await ExerciseDAO.getCountByBodyPart('');

    List<Exercicio> exerciciosAPI = await DioClient.getExercises();

    if (quantidadeAtual != exerciciosAPI.length) {
      await ExerciseDAO.deletar();
      await ExerciseDAO.inserir();
    }
  }
}
