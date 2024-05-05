import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenScan',
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
  final TextEditingController _retypePasswordController =
      TextEditingController();
  bool passwordsMatch = true;
  bool hasReferralCode = false; // 여기에 변수를 정의해줍니다.

  @override
  void dispose() {
    _passwordController.dispose();
    _retypePasswordController.dispose();
    super.dispose();
  }

  void checkPasswordsMatch() {
    if (_passwordController.text != _retypePasswordController.text) {
      setState(() {
        passwordsMatch = false;
      });
    } else {
      setState(() {
        passwordsMatch = true;
      });
    }
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
            'assets/green.png', // Placeholder image URL
            height: 120,
            width: 120,
          ),
          SizedBox(height: 40),
          Center(
            child: Text(
              'Welcome to GreenScan !!!',
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
                  hasReferralCode = !hasReferralCode; // 상태 업데이트 로직 추가
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
        ),
        onChanged: (value) {
          checkPasswordsMatch();
        },
      ),
      SizedBox(height: 16),
      TextField(
        controller: _retypePasswordController,
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Re-type Password',
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: !passwordsMatch ? Colors.red : Colors.grey),
          ),
          errorText:
              !passwordsMatch ? 'Passwords do not match.. Try Again!' : null,
        ),
        onChanged: (value) {
          checkPasswordsMatch();
        },
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
        checkPasswordsMatch();
      },
      child: Text('Register'),
    );
  }
}
