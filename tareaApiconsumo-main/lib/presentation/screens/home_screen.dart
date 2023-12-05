import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tareaapi/providers/respuesta_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void showResponse(RespuestaProvider respuestaProvider, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final respuesta = respuestaProvider.respuestas[index];

        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (respuesta.title.isNotEmpty)
                  Text(
                    'Nombre:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (respuesta.title.isNotEmpty)
                  Text(
                    respuesta.title,
                    style: TextStyle(fontSize: 16),
                  ),
                if (respuesta.price.isNotEmpty)
                  Text(
                    'Precio:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (respuesta.price.isNotEmpty)
                  Text(
                    respuesta.price,
                    style: TextStyle(fontSize: 16),
                  ),
                if (respuesta.description.isNotEmpty)
                  Text(
                    'Descripción:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (respuesta.description.isNotEmpty)
                  Text(
                    respuesta.description,
                    style: TextStyle(fontSize: 16),
                  ),
                if (respuesta.image.isNotEmpty)
                  Image.network(
                    respuesta.image,
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                if (respuesta.category.isNotEmpty)
                  Text(
                    'Categoría:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (respuesta.category.isNotEmpty)
                  Text(
                    respuesta.category,
                    style: TextStyle(fontSize: 16),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final respuestaProvider = context.watch<RespuestaProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('PRODUCTS VARIETY'),
        backgroundColor: Color.fromARGB(255, 91, 218, 102),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/1822/1822045.png',
              height: 300.0,
              width: 300.0,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await respuestaProvider.loadRespuesta();
                if (respuestaProvider.respuestas.isNotEmpty) {
                  final randomIndex =
                      Random().nextInt(respuestaProvider.respuestas.length);
                  showResponse(respuestaProvider, randomIndex);
                }
              },
              child: Text('Crear Producto'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 248, 224, 2),
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
