
import 'package:flutter_test/flutter_test.dart';

import 'package:app_notificaciones/singleton/gestor_notificaciones.dart';
import 'package:app_notificaciones/factory/creador_tarea.dart';
import 'package:app_notificaciones/factory/creador_examen.dart';
import 'package:app_notificaciones/factory/creador_aviso.dart';
import 'package:app_notificaciones/adapter/adaptador_aviso_web.dart';

void main() {

  // PRUEBA 1: SINGLETON
  test('Singleton utiliza una unica instancia', () {
    final gestor1 = GestorNotificaciones();
    final gestor2 = GestorNotificaciones();

    expect(identical(gestor1, gestor2), true);

    gestor1.limpiar();

    gestor1.agregar(CreadorTarea().crear());

    expect(gestor2.notificaciones.length, 1);
    expect(gestor2.notificaciones.first.tipo, 'Tarea');

    gestor1.limpiar();
  });

  // PRUEBA 2: FACTORY METHOD
  test('Factory Method crea notificaciones correctas', () {
    final tarea = CreadorTarea().crear();
    final examen = CreadorExamen().crear();
    final aviso = CreadorAviso().crear();

    expect(tarea.tipo, 'Tarea');
    expect(tarea.prioridad, 'media');

    expect(examen.tipo, 'Examen');
    expect(examen.prioridad, 'alta');

    expect(aviso.tipo, 'Aviso');
    expect(aviso.prioridad, 'baja');
  });

  // PRUEBA 3: ADAPTER
  test('Adapter convierte correctamente el JSON', () {
    final avisoWeb = {
      'asunto': 'Suspensión de clases',
      'contenido': 'Mañana no habrá clases',
      'nivel': 'urgente',
    };

    final adaptador = AdaptadorAvisoWeb();
    final notificacion = adaptador.convertir(avisoWeb);

    expect(notificacion.titulo, 'Suspensión de clases');
    expect(notificacion.mensaje, 'Mañana no habrá clases');
    expect(notificacion.prioridad, 'urgente');
    expect(notificacion.tipo, 'Aviso web');
  });

  // PRUEBA 4: LIMPIEZA DEL GESTOR
  test('Singleton permite limpiar las notificaciones', () {
    final gestor = GestorNotificaciones();

    gestor.limpiar();
    gestor.agregar(CreadorExamen().crear());

    expect(gestor.notificaciones.length, 1);

    gestor.limpiar();

    expect(gestor.notificaciones.isEmpty, true);
  });
}
