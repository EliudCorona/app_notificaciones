
import 'package:flutter/material.dart';
import 'pantallas/pantalla_inicio.dart';

void main() {
  runApp(const UniversidadApp());
}

class UniversidadApp extends StatelessWidget {
  const UniversidadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notificaciones Universitarias',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const PantallaInicio(),
    );
  }
}
