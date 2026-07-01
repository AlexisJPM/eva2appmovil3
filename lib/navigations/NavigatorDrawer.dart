import 'package:evaluacion2/screen/ComentariosScreen.dart';
import 'package:evaluacion2/screen/LeerScreen.dart';
import 'package:evaluacion2/screen/ListaScreen.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                const Text("Menu"),
                const SizedBox(height: 10)
              ],
            ),
          ),
          ListTile(
            title: const Text("Comentarios"),
            onTap: () => irComentarios(context),
            leading: const Icon(Icons.code),
          ),
          ListTile(
            title: const Text("Series"),
            onTap: () => irLista(context),
            leading: const Icon(Icons.code),
          ),
          ListTile(
            title: const Text("Leer"),
            onTap: () => irLeer(context),
            leading: const Icon(Icons.code),
          ),
        ],
      ),
    );
  }
}

void irComentarios(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder:(context) => ComentariosScreen(),));
}

void irLista(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder:(context) => Listascreen(),));
}

void irLeer(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder:(context) => LeerScreen(),));
}