import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  final TextEditingController _recommenderController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _retypePasswordController =
      TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  bool hasReferralCode = false;
  bool idAlreadyExists = false;
  bool passwordsMatch = true;
  bool passwordIsValid = true;
  String? recommenderErrorText;

  void checkId(String id) {
    setState(() {
      if (id == 'testuser') {
        idAlreadyExists = true;
      } else {
        idAlreadyExists = false;
      }
    });
  }

  Future<void> registerUser() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    Map<String, dynamic> body = {
      "email": _idController.text,
      "password": _passwordController.text,
      "confirmPassword": _retypePasswordController.text,
      "userName": _nameController.text,
      "phoneNumber": _phoneNumberController.text
    };

    try {
      var response = await http.post(
          Uri.parse('http://192.168.0.76:8090/api/user/signup'),
          headers: headers,
          body: jsonEncode(body));

      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('Failed with status code: ${response.statusCode}');
        print('Reason: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  void checkPasswordsMatch() {
    if (_passwordController.text != _retypePasswordController.text) {
      setState(() => passwordsMatch = false);
    } else {
      setState(() => passwordsMatch = true);
      registerUser();
    }
  }

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
    _recommenderController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    _idController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
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
          Image.asset('assets/green.png', height: 120, width: 120),
          SizedBox(height: 40),
          Center(
            child: Text('Welcome to GreenScan !!!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 40),
          _buildTextField('Recommender Code',
              controller: _recommenderController, isRecommender: true),
          _buildTextField('ID', controller: _idController),
          _buildPasswordTextField('Password', _passwordController,
              onChanged: checkPasswordValidity),
          _buildPasswordTextField('Re-type Password', _retypePasswordController,
              isRetype: true),
          _buildTextField('Name', controller: _nameController),
          _buildTextField('Phone Number',
              controller: _phoneNumberController, isPhone: true),
          _buildRegisterButton(),
        ],
      ),
    );
  }

  Widget _buildTextField(String label,
      {TextEditingController? controller,
      bool isPhone = false,
      bool isRecommender = false}) {
    return TextField(
      controller: controller,
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
          labelText: label,
          errorText: isRecommender ? recommenderErrorText : null,
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: (label == 'ID' && idAlreadyExists)
                    ? Colors.red
                    : Colors.grey),
          ),
          suffixIcon: isRecommender
              ? Visibility(
                  visible: !hasReferralCode,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[850],
                        foregroundColor: Colors.grey[200]),
                    onPressed: () => setState(() {
                      hasReferralCode = !hasReferralCode;
                      _recommenderController.clear();
                    }),
                    child: Text(
                        hasReferralCode ? 'Change Code' : 'No Recommender'),
                  ))
              : null),
      onChanged: (value) {
        if (label == 'ID') checkId(value);
        if (isRecommender) validateRecommenderCode(value);
      },
    );
  }

  Widget _buildPasswordTextField(String label, TextEditingController controller,
      {Function(String)? onChanged, bool isRetype = false}) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          errorText: isRetype && !passwordsMatch
              ? 'Passwords do not match.. Try Again!'
              : null,
          suffixIcon: !passwordIsValid
              ? ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white),
                  child: Text('Danger'),
                )
              : null),
      onChanged: onChanged,
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, foregroundColor: Colors.white),
      onPressed: () {
        checkPasswordsMatch();
      },
      child: Text('Register'),
    );
  }

  void validateRecommenderCode(String code) {
    setState(() {
      recommenderErrorText = (code.isEmpty || code == 'valid_code')
          ? null
          : "The recommender ID is incorrect. Try Again!";
    });
  }
}
