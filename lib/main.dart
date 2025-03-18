import 'package:desvendando_a_odontologia/repository/gemini_client.dart';
import 'package:desvendando_a_odontologia/services/service_locator.dart';
import 'package:dotenv/dotenv.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'routes.dart'; // Import the routes file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseDatabase.instance.setPersistenceEnabled(true); // Mantém dados offline
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.indexScreen, // Define the initial route as '/'
      routes: Routes.getRoutes(), // Use the routes from the Routes class
    );
  }
}
