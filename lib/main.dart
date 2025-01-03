import 'package:flutter/material.dart';
import 'routes.dart'; // Import the routes file

void main() {
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
