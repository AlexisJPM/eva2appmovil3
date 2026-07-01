import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: Colors.amberAccent,

        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://4kwallpapers.com/images/walls/thumbs_2t/12504.png"),
          fit: BoxFit.cover
          ),
        ),

        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
        
            FilledButton(onPressed: ()=>Navigator.pushNamed(context, "/login"),
             child: Text("Login")),
        
            ElevatedButton(onPressed: ()=>Navigator.pushNamed(context, "/registro"),
             child: Text("Registro"))
        
        
          ],),
        ),
      ),
    );
  }
}