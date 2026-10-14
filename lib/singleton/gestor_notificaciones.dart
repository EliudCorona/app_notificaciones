import '../modelos/notificaciones.dart';

class GestorNotificaciones {
  static final GestorNotificaciones _instancia =
      GestorNotificaciones._interno();

  factory GestorNotificaciones() {
    return _instancia;
  }

  GestorNotificaciones._interno();

  final List<Notificacion> _notificaciones = [];

  List<Notificacion> get notificaciones =>
      List.unmodifiable(_notificaciones);

  void agregar(Notificacion notificacion) {
    _notificaciones.add(notificacion);
  }

  void limpiar() {
    _notificaciones.clear();
  }
}
