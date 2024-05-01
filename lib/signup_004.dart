import 'package:flutter/material.dart';

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
  bool hasReferralCode = false;
  bool isIdDuplicated = false; // 중복된 아이디 상태 변수

  final _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          SizedBox(height: 60),
          Image.asset(
            'assets/images/green.png',
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
        controller: _idController, // 아이디 입력 컨트롤러 연결
        decoration: InputDecoration(
          labelText: 'ID',
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: isIdDuplicated
                  ? Colors.red // 중복된 아이디 시 빨간색 테두리
                  : Colors.grey, // 정상 시 회색 테두리
            ),
          ),
        ),
      ),
      if (isIdDuplicated) // 중복된 아이디 시에만 오류 메시지 표시
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            'The ID that already exists.. Try again !',
            style: TextStyle(color: Colors.red),
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

  Widget _buildRegisterButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        // 아이디 중복 체크 로직
        if (_idController.text == 'existingId') {
          setState(() {
            isIdDuplicated = true;
          });
        } else {
          setState(() {
            isIdDuplicated = false;
          });
          // 회원가입 로직
        }
      },
      child: Text('Register'),
    );
  }
}
