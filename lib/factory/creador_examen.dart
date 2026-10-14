import '../modelos/notificaciones.dart';
import 'creador_notificacion.dart';

class CreadorExamen extends CreadorNotificacion {
  @override
  Notificacion crear() {
    return Notificacion(
      titulo: 'Próximo examen',
      mensaje: 'Tienes un examen esta semana.',
      prioridad: 'alta',
      tipo: 'Examen',
    );
  }
}
