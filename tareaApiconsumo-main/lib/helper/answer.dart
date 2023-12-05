import 'package:tareaapi/domain/entities/respuesta.dart';
import 'package:dio/dio.dart';

class ApiAnswer {
  final String url = "https://fakestoreapi.com/products";
  final _dio = Dio();

  Future<List<Respuesta>> getRespuesta() async {
    final response = await _dio.get(url);
    final List<dynamic> data = response.data;

    List<Respuesta> respuestas = data.map((item) => Respuesta.fromJson(item)).toList();

    return respuestas;
  }
}
