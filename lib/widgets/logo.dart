import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 84,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: 79,
        backgroundImage: AssetImage('assets/logo.png'),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}
