import 'package:evaluacion2/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
        onPressed: () => login(context, correo, contrasenia),
        label: Text("Login"),
        icon: Icon(Icons.login_sharp),
      ),
    ],
  ));
}

Future<void> login(context, correo, contrasenia) async {
  try {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: correo.text,
      password: contrasenia.text,
    );
    final Session? session = res.session;
    final User? user = res.user;

    print(user.toString());

    Navigator.pushNamed(context, "/lista");
    
  } catch (e) {
    print(e.toString());
  }
}
