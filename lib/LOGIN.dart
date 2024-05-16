import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> login() async {
    final url = Uri.parse('http://192.168.56.1:8080/api/user/login'); // Update with your server's IP
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'userName': _idController.text,
          'password': _passwordController.text,
        }),
      );

      setState(() {
        _errorMessage = null;
      });

      if (response.statusCode == 200) {
        print('로그인 성공');
        final token = response.headers['authorization'];
        // TODO: 토큰 저장 및 사용
      } else {
        setState(() {
          _errorMessage = '로그인 실패: ${response.body}';
        });
        print('로그인 실패: ${response.body}');
      }
    } catch (e) {
      setState(() {
        _errorMessage = '네트워크 요청 중 오류 발생: $e';
      });
      print('네트워크 요청 중 오류 발생: $e');
    }
  }

  @override
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
                width: 150, // 이미지 크기 축소
                height: 150,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Welcome Back !!',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 48.0),
              TextField(
                controller: _idController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.blue), // 파란색 테두리
                  ),
                  labelText: 'ID',
                ),
              ),
              const SizedBox(height: 24.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.blue), // 파란색 테두리
                  ),
                  labelText: 'Password',
                  suffixIcon: const Icon(Icons.error_outline, color: Colors.red,), // 에러 아이콘
                ),
              ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ),
              const SizedBox(height: 48.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), backgroundColor: Colors.green, // 초록색 배경
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // 덜 둥근 모서리
                  ),
                ),
                onPressed: login,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white), // 흰색 텍스트
                ),
              ),
              TextButton(
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                    children: const [
                      TextSpan(
                        text: 'You don\'t have an account? Click ',
                        style: TextStyle(color: Colors.grey), // 회색 텍스트
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(color: Colors.green), // 초록색 텍스트
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