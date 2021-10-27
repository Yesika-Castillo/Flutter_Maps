import 'package:flutter/material.dart';
import 'package:proyecto/screens/screens.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'login',
      routes: {
        // rutas
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreenView(),
       'registry': (_) => RegistryScreen(),
       'homepage':(_) => HomepagenScreen(),
        
      },
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}
