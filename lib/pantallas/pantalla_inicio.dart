
import 'package:flutter/material.dart';

import '../singleton/gestor_notificaciones.dart';
import '../factory/creador_notificacion.dart';
import '../factory/creador_tarea.dart';
import '../factory/creador_examen.dart';
import '../factory/creador_aviso.dart';
import '../adapter/adaptador_aviso_web.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  final gestor = GestorNotificaciones();

  void generar(CreadorNotificacion creador) {
    setState(() {
      gestor.agregar(creador.crear());
    });
  }

  void importarAvisoWeb() {
    final avisoWeb = {
      'asunto': 'Suspensión de clases',
      'contenido': 'Mañana no habrá clases',
      'nivel': 'urgente',
    };

    final adaptador = AdaptadorAvisoWeb();

    setState(() {
      gestor.agregar(adaptador.convertir(avisoWeb));
    });
  }

  Color colorPrioridad(String prioridad) {
    switch (prioridad.toLowerCase()) {
      case 'urgente':
      case 'alta':
        return Colors.red;
      case 'media':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  IconData icono(String tipo) {
    switch (tipo) {
      case 'Tarea':
        return Icons.assignment;
      case 'Examen':
        return Icons.school;
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    final lista = gestor.notificaciones;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones Universitarias'),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Panel de notificaciones',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: () => generar(CreadorTarea()),
              icon: const Icon(Icons.assignment),
              label: const Text('Generar tarea'),
            ),

            ElevatedButton.icon(
              onPressed: () => generar(CreadorExamen()),
              icon: const Icon(Icons.school),
              label: const Text('Generar examen'),
            ),

            ElevatedButton.icon(
              onPressed: () => generar(CreadorAviso()),
              icon: const Icon(Icons.campaign),
              label: const Text('Generar aviso'),
            ),

            ElevatedButton.icon(
              onPressed: importarAvisoWeb,
              icon: const Icon(Icons.cloud_download),
              label: const Text('Importar aviso JSON'),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total de notificaciones: ${lista.length}'),
                TextButton(
                  onPressed: () {
                    setState(() {
                      gestor.limpiar();
                    });
                  },
                  child: const Text('Limpiar'),
                ),
              ],
            ),

            const Divider(),

            Expanded(
              child: lista.isEmpty
                  ? const Center(
                      child: Text('No hay notificaciones'),
                    )
                  : ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        final n = lista[index];

                        return Card(
                          child: ListTile(
                            leading: Icon(
                              icono(n.tipo),
                              color: colorPrioridad(n.prioridad),
                            ),
                            title: Text(n.titulo),
                            subtitle: Text(
                              '${n.mensaje}\nTipo: ${n.tipo}',
                            ),
                            isThreeLine: true,
                            trailing: Text(
                              n.prioridad.toUpperCase(),
                              style: TextStyle(
                                color: colorPrioridad(n.prioridad),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
