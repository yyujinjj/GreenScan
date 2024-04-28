import 'package:flutter/material.dart';

void main() => runApp(const GreenscanApp());

class GreenscanApp extends StatelessWidget {
  const GreenscanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Greenscan',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const StartScreen(),
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Container(
                    color: Colors.green,
                    height: 300.0, // Increased size
                    width: 300.0, // Increased size
                    child: Center(
                      child: Icon(
                        Icons.delete_outline,
                        size: 100.0, // Adjusted icon size
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'Greenscan',
                  style: TextStyle(
                    fontSize: 36.0, // Increased font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Helps with proper waste separation',
                  style: TextStyle(
                    fontSize: 20.0, // Increased font size
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 48.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: OutlinedButton(
                          onPressed: () {
                            // Implement sign-up logic
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: const EdgeInsets.all(20.0),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0, // Increased font size
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement login logic
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.lightGreen,
                            padding: const EdgeInsets.all(20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20.0), // Increased font size
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
