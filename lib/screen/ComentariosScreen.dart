import 'package:evaluacion2/main.dart';
import 'package:evaluacion2/navigations/NavigatorDrawer.dart';
import 'package:flutter/material.dart';

class ComentariosScreen extends StatelessWidget {
  const ComentariosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Comentarios")),
      drawer: MiDrawer(),
      body: Center(child: Container(width: 350, child: formulario(context))),
    );
  }
}

Widget formulario(BuildContext context) {
  TextEditingController id = TextEditingController();
  TextEditingController serie = TextEditingController();
  TextEditingController comentario = TextEditingController();

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(
        controller: id,
        decoration: const InputDecoration(labelText: 'ID'),
        keyboardType: TextInputType.number,
      ),
      const SizedBox(height: 10),
      TextField(
        controller: serie,
        decoration: const InputDecoration(labelText: 'Serie'),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: comentario,
        maxLines: 3,
        decoration: const InputDecoration(labelText: 'Comentario'),
      ),
      const SizedBox(height: 20),
      FilledButton(
        onPressed: () => guardar(context, id, serie, comentario),
        child: const Text("Guardar"),
      ),
    ],
  );
}

Future<void> guardar(BuildContext context,
  TextEditingController id,
  TextEditingController serie,
  TextEditingController comentario,
) async {
  try {
    await supabase.from('comentarios').insert({
      'id': int.parse(id.text),
      'serie': serie.text,
      'comentario': comentario.text,
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("¡Éxito!"),
        );
      },
    );

    id.clear();
    serie.clear();
    comentario.clear();

  } catch (e) {
    print("Error al guardar: ${e.toString()}");
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error!"),
        );
      },
    );
  }
}
