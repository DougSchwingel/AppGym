import 'package:gym_app/BD/db_helper.dart';
import 'package:gym_app/BD/dio_client.dart';
import 'package:gym_app/Classes/exercicio_classe.dart';

class ExerciseDAO {
  static Future<void> inserir() async {
    var exerc = DioClient.getExercises();

    var db = await DBHelper.getInstance();
    for (var element in exerc) {
      await db.insert(
        'exercises',
        element.toMap(),
      );
    }
  }

  static Future<List<Exercicio>> carregarExercicios() async {
    var db = await DBHelper.getInstance();
    List<Map<String, Object?>> resultado = await db.query('exercicio');
    List<Exercicio> exercicios = resultado
        .map((mapExercicio) => Exercicio.fromMap(mapExercicio))
        .toList();
    return exercicios;
  }
}
