import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: AddMobileExchangeTicketPage(),
    routes: {
      '/home': (context) => HomeScreen(),
      '/addMobileExchangeTicket': (context) => AddMobileExchangeTicketPage(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}

class AddMobileExchangeTicketPage extends StatefulWidget {
  @override
  _AddMobileExchangeTicketPageState createState() =>
      _AddMobileExchangeTicketPageState();
}

class _AddMobileExchangeTicketPageState
    extends State<AddMobileExchangeTicketPage> {
  int incorrectAttempts = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Mobile Exchange Ticket',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: <Widget>[
          buildExchangeItem(
              context, 'assets/snack.png', '7500', 'nacho', 1, true),
          buildExchangeItem(
              context, 'assets/cookies.png', '5000', 'choco-chip', 2, true),
          buildExchangeItem(
              context, 'assets/chocolate.png', '3500', 'Choco-bar', 3, true),
          buildExchangeItem(
              context, 'assets/gift.png', '8000', 'basket-chip', 4, true),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: TextButton.icon(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          label: Text('Go back', style: TextStyle(color: Colors.black)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget buildExchangeItem(
      BuildContext context,
      String imagePath,
      String exchangerTicketPrice,
      String exchangerTicketName,
      int exchangerTicketId,
      bool confirm) {
    return GestureDetector(
      onTap: () {
        showExchangeDialog(context, imagePath, exchangerTicketPrice,
            exchangerTicketName, exchangerTicketId, confirm);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(exchangerTicketPrice,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  void showExchangeDialog(
      BuildContext context,
      String imagePath,
      String exchangerTicketName,
      String exchangerTicketPrice,
      int exchangerTicketId,
      bool confirm) {
    final TextEditingController _idController =
        TextEditingController(); // 이메일 입력
    final TextEditingController _passwordController =
        TextEditingController(); // 비밀번호 입력

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.lightBlue[100],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: Colors.blue)),
          title: Column(
            children: <Widget>[
              Image.asset(imagePath, width: 100, height: 100),
              Text('Would you like to exchange for this product?',
                  textAlign: TextAlign.center),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (confirm)
                Text(
                  "Personal information was entered incorrectly.\nWould you like to re-enter? (${incorrectAttempts + 1}/5)",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              if (incorrectAttempts < 5) ...[
                SizedBox(height: 20),
                TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  obscureText: true,
                ),
              ] else
                Text(
                  "You have exceeded the maximum number of attempts.",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
          actions: <Widget>[
            if (incorrectAttempts < 5)
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: Text('YES'),
                onPressed: () async {
                  String email = _idController.text;
                  String password = _passwordController.text;
                  final prefs = await SharedPreferences.getInstance();
                  String? token = prefs.getString('token');

                  // 서버로 인증 및 교환 요청 보내기
                  var response = await http.post(
                    Uri.parse('http://192.168.0.76:8090/exchanger/exchange'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                      'Authorization': token ?? ''
                    },
                    body: jsonEncode(<String, dynamic>{
                      'email': email,
                      'password': password,
                      'exchangerTicketId': exchangerTicketId,
                      'confirm': true, // 서버측에서 요구할 수 있는 필드
                    }),
                  );
                  print(response.body);
                  if (response.statusCode == 200) {
                    var jsonResponse = jsonDecode(response.body);

                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(jsonResponse['message'])),
                    );
                  } else {
                    print("Failed to save barcode path"); // 로그 추가
                    setState(() {
                      incorrectAttempts++;
                    });
                    Navigator.of(context).pop();
                    showExchangeDialog(context, imagePath, exchangerTicketName,
                        exchangerTicketPrice, exchangerTicketId, true);
                  }
                },
              ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey,
              ),
              child: Text('NO'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
