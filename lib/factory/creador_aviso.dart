import '../modelos/notificaciones.dart';
import 'creador_notificacion.dart';

class CreadorAviso extends CreadorNotificacion {
  @override
  Notificacion crear() {
    return Notificacion(
      titulo: 'Aviso universitario',
      mensaje: 'Consulta la información escolar.',
      prioridad: 'baja',
      tipo: 'Aviso',
    );
  }
}
