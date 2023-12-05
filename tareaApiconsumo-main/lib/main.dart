import 'package:flutter/material.dart';
import 'package:tareaapi/presentation/screens/home_screen.dart';
import 'package:tareaapi/providers/respuesta_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RespuestaProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
