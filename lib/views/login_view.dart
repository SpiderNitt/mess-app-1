import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const [
              Center(
                child: Text('Mess App'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
