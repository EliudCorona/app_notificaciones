import '../modelos/notificaciones.dart';

class AdaptadorAvisoWeb {
  Notificacion convertir(Map<String, dynamic> json) {
    return Notificacion(
      titulo: (json['asunto'] ?? 'Sin título').toString(),
      mensaje: (json['contenido'] ?? '').toString(),
      prioridad: (json['nivel'] ?? 'baja').toString(),
      tipo: 'Aviso web',
    );
  }
}
