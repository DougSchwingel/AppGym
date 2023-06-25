import 'package:dio/dio.dart';
import 'package:gym_app/BD/list_exercises.dart';

class DioClient {
  static dynamic getExercises() async {
    final Dio dio = Dio();

    final response =
        await dio.get('https://exercisedb.p.rapidapi.com/exercises',
            options: Options(headers: {
              'X-RapidAPI-Key':
                  '7c706b2aeemsh149dcea966616cdp1ba989jsn3b83e87323ca',
              'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
            }));

    ListExercises lista = ListExercises.fromMap(response.data);

    return lista;
  }
}
