import 'package:flutter_test/flutter_test.dart';
import 'package:app_notificaciones/main.dart';

void main() {
  testWidgets('La aplicación inicia correctamente', (tester) async {
    await tester.pumpWidget(const UniversidadApp());

    expect(
      find.text('Notificaciones Universitarias'),
      findsOneWidget,
    );

    expect(
      find.text('Panel de notificaciones'),
      findsOneWidget,
    );
  });
}
