import 'package:dio/dio.dart';
import 'package:gym_app/BD/list_exercises.dart';
import 'package:gym_app/Classes/exercicio_classe.dart';

class DioClient {
  static Future<List<Exercicio>> getExercises() async {
    final Dio dio = Dio();

    final response = await dio.get(
      'https://exercisedb.p.rapidapi.com/exercises',
      options: Options(headers: {
        'X-RapidAPI-Key': '7c706b2aeemsh149dcea966616cdp1ba989jsn3b83e87323ca',
        'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
      }),
    );

    List<dynamic> exerciseList = response.data;

    List<Exercicio> exercicios = exerciseList
        .map((mapExercicio) => Exercicio.fromMap(mapExercicio))
        .toList();
    return exercicios;
  }
}
