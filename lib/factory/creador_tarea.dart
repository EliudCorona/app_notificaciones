
import '../modelos/notificaciones.dart';
import 'creador_notificacion.dart';

class CreadorTarea extends CreadorNotificacion {
  @override
  Notificacion crear() {
    return Notificacion(
      titulo: 'Nueva tarea',
      mensaje: 'Tienes una actividad pendiente.',
      prioridad: 'media',
      tipo: 'Tarea',
    );
  }
}
