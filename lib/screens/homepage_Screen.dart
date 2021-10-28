import 'package:flutter/material.dart';
import 'package:proyecto/screens/screens.dart';

void main() => runApp(HomepagenScreen());

class HomepagenScreen extends StatelessWidget {
  const HomepagenScreen({Key? key}) : super(key: key);

  // Este widget es la raíz de su aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Menu')),
          body: Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Botton 1
                new RaisedButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    child: Text(
                      "Buscar Dirección",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MapScreenView()));
                          ;
                    }),
                //Boton 2

                new RaisedButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    child: Text(
                      "Almacenamiento",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'home');
                    }),

                // Boton 3

                new RaisedButton(
                        color: Colors.purple,
                        textColor: Colors.white,
                        child: Text(
                          "Cerrar Sesión",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'login');
                        }),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
