import 'package:flutter/material.dart';


void main() => runApp(HomepagenScreen());

class HomepagenScreen extends StatelessWidget {
  const HomepagenScreen({ Key? key }) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
            debugShowCheckedModeBanner: false,
      title: 'Implementar botones en flutter',
      
      theme: ThemeData(
        primarySwatch: Colors.purple,
        
      ),
      home: Scaffold(
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
                      "Map",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'home');
                    }),
          //Boton 2 
               new RaisedButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    child: Text(
                      "Atras",
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