import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Page',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => IdentityVerificationScreen()));
          },
          child: Text('Verify Identity'),
        ),
      ),
    );
  }
}

class IdentityVerificationScreen extends StatefulWidget {
  @override
  _IdentityVerificationScreenState createState() =>
      _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState
    extends State<IdentityVerificationScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int attemptCount = 0;
  String errorMessage = '';
  bool get isLockedOut => attemptCount >= 5;

  void _verifyIdentity() {
    if (_idController.text == "correct_id" &&
        _passwordController.text == "correct_password") {
      // Navigate to another screen or handle success
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChangePersonalInformationScreen()));
    } else {
      if (!isLockedOut) {
        setState(() {
          attemptCount++;
          errorMessage = 'Personal information was entered Incorrect';
        });
      }
    }

    if (isLockedOut) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Authentication Failed'),
          content: Text('You cannot authenticate yourself for 10 hours.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Personal Information"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Verify your identity',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                    labelText: "ID",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _verifyIdentity,
                  child: Text('Register'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                if (errorMessage.isNotEmpty && !isLockedOut) ...[
                  Text(errorMessage,
                      style: TextStyle(color: Colors.red, fontSize: 16)),
                  Text('Would you like to re-enter? ($attemptCount/5)',
                      style: TextStyle(color: Colors.red)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Reset error message and let user re-enter credentials
                          setState(() {
                            errorMessage = '';
                          });
                        },
                        child: Text('Yes'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('No'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      ),
                    ],
                  )
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChangePersonalInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Personal Information"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text("This is the screen to change personal information."),
      ),
    );
  }
}
