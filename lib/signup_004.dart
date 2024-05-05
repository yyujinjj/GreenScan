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
  bool hasReferralCode = false;
  bool idAlreadyExists = false; // 상태 변수 추가: ID 중복 확인

  // ID 중복을 체크하는 함수
  void checkId(String id) {
    setState(() {
      // ID 중복 검사 로직 (예제로는 단순히 'testuser'를 중복된 ID로 설정)
      if (id == 'testuser') {
        idAlreadyExists = true;
      } else {
        idAlreadyExists = false;
      }
    });
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
                // 추천인 코드가 없을 때의 로직
              },
              child: Text('No Recommender'),
            ),
          ),
        ),
      ),
      SizedBox(height: 16),
      TextField(
        decoration: InputDecoration(
          labelText: 'ID',
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: idAlreadyExists ? Colors.red : Colors.grey),
          ),
          errorText: idAlreadyExists
              ? 'The ID that already exists.. Try again!'
              : null,
        ),
        onChanged: (value) => checkId(value), // 사용자 입력에 반응하여 ID 검사
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
        // Registration logic
      },
      child: Text('Register'),
    );
  }
}
