import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'asset/img/barcode.png',
                width: 150, // Reduced image size
                height: 150,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Welcome Back !!',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 48.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.blue), // Blue border
                  ),
                  labelText: 'ID',
                ),
              ),
              const SizedBox(height: 24.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.blue), // Blue border
                  ),
                  labelText: 'Password',
                  suffixIcon: const Icon(Icons.error_outline,color: Colors.red,), // Changed to visibility icon
                ),
              ),
              const SizedBox(height: 12.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Passwords do not match. Try Again!',
                  style: TextStyle(color: Colors.red[700], fontSize: 14.0),
                ),
              ),
              const SizedBox(height: 48.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), backgroundColor: Colors.green, // Green background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Less rounded corners
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white), // White text color
                ),
              ),
              TextButton(
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                    children: const [
                      TextSpan(
                        text: 'You don\'t have an account? Click ',
                        style: TextStyle(color: Colors.grey), // Grey text color
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(color: Colors.green), // Green text color for 'Sign Up'
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}