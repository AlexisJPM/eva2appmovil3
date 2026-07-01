import 'package:evaluacion2/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegistroScreen extends StatelessWidget {
  const RegistroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(width: 300, child: formulario(context))),
    );
  }
}

Widget formulario(context) {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();

  return (Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(controller: correo,
      decoration: const InputDecoration(
        labelText: 'Correo electrónico',
      ),),
      TextField(controller: contrasenia, obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Contraseña',
      ),),

      ElevatedButton.icon(
        onPressed: () => registro(context, correo, contrasenia),
        label: Text("Registro"),
        icon: Image.asset("assets/icons/registro.png", width: 30),
      ),
    ],
  ));
}

Future<void> registro(context, correo, contrasenia) async {
  final AuthResponse res = await supabase.auth.signUp(
    email: correo.text,
    password: contrasenia.text,
  );
  final Session? session = res.session;
  final User? user = res.user;

  print(user);

  Navigator.pushNamed(context, "/login");
}
