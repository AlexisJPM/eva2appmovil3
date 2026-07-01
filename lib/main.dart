import 'package:evaluacion2/screen/ComentariosScreen.dart';
import 'package:evaluacion2/screen/ListaScreen.dart';
import 'package:evaluacion2/screen/LoginScreen.dart';
import 'package:evaluacion2/screen/RegistroScreen.dart';
import 'package:evaluacion2/screen/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {

  await Supabase.initialize(
    url: 'https://imrwqcllwddjqxurilmm.supabase.co',
    publishableKey: 'sb_publishable_4QirGh4YHJT4scSJuvYh1A_yCAVehqV',
  );
  
  runApp(const AppEva());
}
final supabase = Supabase.instance.client;

class AppEva extends StatelessWidget {
  const AppEva({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: "/comentarios",

      routes: {
        "/": (context) => const MainHomeScreen(),
        "/login": (context) => LoginScreen(),
        "/registro": (context) => RegistroScreen(),
        "/comentarios": (context) => const ComentariosScreen(),
        "/lista": (context) => const Listascreen(),
      },
    );
  }
}

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Evaluación 2"),
        actions: [
          Builder(
            builder: (newContext) {
              return IconButton(
                icon: const Icon(Icons.message_outlined),
                onPressed: () {
                  showDialog(
                    context: newContext,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text("Evaluacion 2"),
                        content: Text(
                          "Nombre: Alexis Panchi\n"
                          "Usuario GIT: AlexisJPM",
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
      body: WelcomeScreen(),
    );
  }
}