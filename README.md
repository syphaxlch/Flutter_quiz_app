# Jeu de Quiz Interactif

## Description du projet

Ce projet consiste en un jeu de quiz interactif développé avec **Flutter** et **Firebase**. L'application permet à l'utilisateur de répondre à des questions de manière fluide et dynamique, avec un système de score en temps réel et un chronomètre. Les questions sont récupérées dynamiquement via une base de données Firebase Realtime Database.

### Fonctionnalités principales :
- **Démarrage du quiz** : L'utilisateur peut commencer une partie en appuyant sur le bouton "Commencer".
- **Chronomètre** : Le jeu dispose d'un compte à rebours qui limite la durée de chaque quiz.
- **Système de score en temps réel** : Le score est mis à jour au fur et à mesure que l'utilisateur répond aux questions.
- **Effet de confettis** : À la fin du quiz, un effet de confettis se déclenche pour célébrer la fin du jeu.
- **Page de crédits** : Une page dédiée pour afficher les informations sur l'équipe de développement.

![firebase](https://github.com/user-attachments/assets/d0ff6ccd-ed07-46bd-b58e-e9fc8942a290)

# Demonstration :

![quiz-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/861addde-552f-4bd9-a879-a5375855fc09)

## Installation

### Prérequis
Avant de pouvoir exécuter le projet, assurez-vous d'avoir installé les outils suivants :
- [Flutter](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio)
- Un appareil Android ou un émulateur pour tester l'application

### Étapes d'installation
1. Clonez ce repository sur votre machine locale :

   ```bash
   git clone https://github.com/syphaxlch/flutter_quiz_app.git
   cd flutter_quiz_app
   ```
2. Installez les dépendances Flutter nécessaires :

   ```bash
   flutter pub get
   ```
3. Configurez Firebase en suivant [la documentation officielle de Firebase](https://firebase.flutter.dev/docs/overview).
   - Créez un projet Firebase dans la console Firebase.
   - Activez Firebase Realtime Database.
   - Ajoutez les fichiers de configuration Firebase à votre projet Flutter (fichier `google-services.json` pour Android).

4. Assurez-vous que votre appareil ou émulateur Android est prêt à tester l'application.

5. Exécutez l'application sur votre appareil ou émulateur Android :

   ```bash
   flutter run
   ```

Auteurs
- Syphax LAKHDARCHAOUCHE
