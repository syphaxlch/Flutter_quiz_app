import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = -1;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }
  // Fonction pour quitter l'application
  void _exitApp() {
    SystemNavigator.pop(); // Ferme l'application
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Quiz Game")),
        body: Center(
          child: Container(
            color: Colors.yellow,
            padding: EdgeInsets.all(20), // Ajouter un peu de padding autour
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Bouton Commencer la partie
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50), // Largeur de 300px
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.play_arrow, size: 24),
                      SizedBox(width: 10),
                      Text("Commencer la partie"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Bouton Crédits
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 45), // Largeur de 250px
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info, size: 24),
                      SizedBox(width: 5),
                      Text("Crédits"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Bouton Quitter
                ElevatedButton(
                  onPressed: _exitApp,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 45), // Largeur de 250px
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.exit_to_app, size: 24),
                      SizedBox(width: 5),
                      Text("Quitter le jeu"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
