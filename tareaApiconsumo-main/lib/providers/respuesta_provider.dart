import 'package:flutter/material.dart';
import 'package:tareaapi/domain/entities/respuesta.dart';
import 'package:tareaapi/helper/answer.dart';

class RespuestaProvider extends ChangeNotifier {
  final _apiAnswer = ApiAnswer();
  List<Respuesta> respuestas = [];

  Future<void> loadRespuesta() async {
    await Future.delayed(const Duration(seconds: 5));
    respuestas = await _apiAnswer.getRespuesta();
    notifyListeners();
  }
}
