import 'package:flutter/material.dart';
import 'package:gym_app/BD/db_helper.dart';
import 'package:gym_app/Classes/exercicio_class.dart';
import 'package:gym_app/Classes/exerc_list_class.dart';
import 'package:gym_app/Classes/workout_class.dart';
import 'package:gym_app/PreparedWidgets/workout_card.dart';

class WorkoutDAO {
  static Future<void> insert(List<Workout> exerc) async {
    var db = await DBHelper.getInstance();
    for (var element in exerc) {
      Map<String, dynamic> value = {
        'id': element.id,
        'name': element.name,
        'info': element.info,
      };
      await db.insert(
        'workouts',
        value,
      );
    }
  }

  static Future<List<WorkoutCard>> loadWorkouts() async {
    var db = await DBHelper.getInstance();
    List<Map<String, Object?>> workouts = await db.query('workouts');
    List<Workout> work_exer =
        workouts.map((mapTreino) => Workout.fromMap(mapTreino)).toList();

    List<Map<String, Object?>> resultado = await db.query('exercises_list');
    List<ListExer> listExer =
        resultado.map((mapListE) => ListExer.fromMap(mapListE)).toList();

    List<Exercise> exerList = [];
    List<WorkoutCard> cardTreinos = [];

    for (var element in work_exer) {
      for (var lExer in listExer) {
        List<Exercise> ex = await loadWorkoutsByID(lExer.ex_id.toString());

        for (var exer in ex) {
          exerList.add(Exercise(
              bodyPart: exer.bodyPart,
              equipment: exer.equipment,
              gifUrl: exer.gifUrl,
              id: exer.id,
              name: exer.name,
              target: exer.target));
        }
      }

      cardTreinos.add(WorkoutCard(
          nome: element.name,
          icone: Image.asset('assets/icons/exercise_darkmode.png'),
          info: element.info,
          wExer: exerList,
          id: element.id!));
    }
    return cardTreinos;
  }

  static Future<void> insertListWeights(ListExer lExer) async {
    var db = await DBHelper.getInstance();

    Map<String, dynamic> value = {
      'w_id': lExer.w_id,
      'ex_id': lExer.ex_id,
    };
    await db.insert(
      'exercises_list',
      value,
    );
  }

  static Future<List<Exercise>> loadWorkoutsByID(String id) async {
    var db = await DBHelper.getInstance();
    List<Map<String, Object?>> resultado =
        await db.rawQuery('SELECT *FROM exercises WHERE id = ?', [id]);
    List<Exercise> exercicio = resultado
        .map((mapExercicio) => Exercise.fromMap(mapExercicio))
        .toList();
    return exercicio;
  }
}
