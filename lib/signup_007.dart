import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greenscan',
      theme: ThemeData(
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
  final TextEditingController _recommenderController = TextEditingController();
  bool _hasReferralCode = false;
  String? _recommenderErrorText;

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
      TextFormField(
        controller: _recommenderController,
        decoration: InputDecoration(
          labelText: 'Recommender Code',
          border: OutlineInputBorder(),
          errorText: _recommenderErrorText,
          suffixIcon: Visibility(
            visible: !_hasReferralCode,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[850],
                foregroundColor: Colors.grey[200],
              ),
              onPressed: () {
                // Additional button logic
              },
              child: Text('No Recommender'),
            ),
          ),
        ),
        onChanged: (value) {
          setState(() {
            _recommenderErrorText = _validateRecommenderCode(value)
                ? null
                : "The recommender ID is incorrect. Try Again!";
          });
        },
      ),
      // Other text fields...
      SizedBox(height: 16),
      TextField(
        decoration: InputDecoration(
          labelText: 'ID',
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(height: 16),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(),
        ),
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
}

bool _validateRecommenderCode(String code) {
  return code.length >= 10; // Example validation logic
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
