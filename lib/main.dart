import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/credits_page.dart'; // Importer la page des crédits
import 'screens/quiz_page.dart'; // Importer l'écran des questions
import 'theme/theme.dart'; // Importer le thème
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void _exitApp() {
    SystemNavigator.pop();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Utilisation du thème
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz Game"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.info, color: Colors.white,),
                        SizedBox(width: 5),
                        Text(
                          "Commencer la partie",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), // Texte en blanc
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Utilisation de Builder pour un BuildContext valide
                Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreditsPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.info, color: Colors.white,),
                        SizedBox(width: 5),
                        Text(
                          "Crédits",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), // Texte en blanc
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _exitApp,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.exit_to_app,color: Colors.white,),
                      SizedBox(width: 5),
                      Text(
                        "Quitter le jeu",
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), // Texte en blanc
                      ),
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
