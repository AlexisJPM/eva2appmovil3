import 'package:evaluacion2/main.dart';
import 'package:evaluacion2/navigations/NavigatorDrawer.dart';
import 'package:flutter/material.dart';

class LeerScreen extends StatelessWidget {
  const LeerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Comentarios")),
      drawer: MiDrawer(),
      body: lista(),
    );
  }
}

Future<List<dynamic>> leerSupa() async {
  final data = await supabase
      .from('comentarios')
      .select();
  return data;
}
  Widget lista() {
    return FutureBuilder(future: leerSupa(), builder: (context, snapshot) {
        
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final data = snapshot.data!;
          
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];

              return ListTile(
                leading: Text(item['id'].toString()),
                title: Text("Serie: ${item['serie']}"),
                subtitle: Text("Comentario: ${item['comentario']}"),
                
              );
            },
          );
        } else {
          return const Center(
            child: Text("No hay comentarios"),
          );
        }
      },
    );
  }
  