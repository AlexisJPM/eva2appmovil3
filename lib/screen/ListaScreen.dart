import 'dart:convert';
import 'package:evaluacion2/navigations/NavigatorDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Listascreen extends StatelessWidget {
  const Listascreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Series")),
      drawer: MiDrawer(),
      body: listaExterna(context),
    );
  }
}

Future<List> leerUrl(String url) async {
  final respuesta = await http.get(Uri.parse(url));
  return json.decode(respuesta.body)['series'];
}

Widget listaExterna(BuildContext context) {
  String url = "https://jritsqmet.github.io/web-api/series.json";

  return FutureBuilder(
    future: leerUrl(url),
    builder: (context, snapshot) {
      
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (snapshot.hasData) {
        final data = snapshot.data!;

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];

            return ListTile(
              isThreeLine: true,
              title: Text("${item['titulo']} (${item['anio']})"),
              subtitle: Text(
                "Creador: ${item['metadata']['creador']}\nDescripción: ${item['descripcion']}"
              ),
              leading: SizedBox(
                width: 50,
                child: Image.network(
                  item['info']['imagen'],
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(item['titulo']),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Image.network(
                                item['info']['imagen'],
                                height: 180,
                                errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text("Año: ${item['anio']}", style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      } else {
        return Column(
          children: [(Text("No hay Datos")), CircularProgressIndicator()],
        );
      }
    },
  );
}
