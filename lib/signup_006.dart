import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greenscan',
      theme: ThemeData(
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool hasReferralCode = false;
  bool passwordIsValid = true;

  void checkPasswordValidity(String password) {
    bool hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowerCase = password.contains(RegExp(r'[a-z]'));
    bool hasDigit = password.contains(RegExp(r'\d'));
    bool hasSpecialCharacter =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    setState(() {
      passwordIsValid =
          hasUpperCase && hasLowerCase && hasDigit && hasSpecialCharacter;
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          SizedBox(height: 60),
          Image.asset(
            'assets/green.png',
            height: 120,
            width: 120,
          ),
          SizedBox(height: 40),
          Center(
            child: Text(
              'Welcome to Greenscan !!!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 40),
          ..._buildTextFields(),
          SizedBox(height: 20),
          _buildRegisterButton(context),
          SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                // Navigate to the login screen
              },
              child: Text(
                'Already have an account? Sign in',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTextFields() {
    return [
      TextField(
        decoration: InputDecoration(
          labelText: 'Recommender Code',
          border: OutlineInputBorder(),
          suffixIcon: Visibility(
            visible: !hasReferralCode,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[850],
                foregroundColor: Colors.grey[200],
              ),
              onPressed: () {
                setState(() {
                  hasReferralCode = !hasReferralCode;
                });
              },
              child: Text(hasReferralCode ? 'Change Code' : 'No Recommender'),
            ),
          ),
        ),
      ),
      SizedBox(height: 16),
      TextField(
        decoration: InputDecoration(
          labelText: 'ID',
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 16),
      TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(),
          suffixIcon: !passwordIsValid
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Danger color
                    foregroundColor: Colors.white, // Text color
                  ),
                  onPressed: () {}, // To disable the button's functionality
                  child: Text('Danger'),
                )
              : null,
        ),
        onChanged: checkPasswordValidity,
      ),
      SizedBox(height: 16),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Re-type Password',
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 16),
      TextField(
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 16),
      TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'Phone Number',
          border: OutlineInputBorder(),
        ),
      ),
    ];
  }

  Widget _buildRegisterButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        // Registration logic
      },
      child: Text('Register'),
    );
  }
}
