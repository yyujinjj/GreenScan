import 'package:flutter/material.dart';
import 'mainscreen.dart';  // Ensure that HomeScreen is defined in mainscreen.dart

void main() {
  runApp(MaterialApp(
    home: AddMobileExchangeTicketPage(),
    routes: {
      '/home': (context) => HomeScreen(),  // Define route for HomeScreen
    },
  ));
}

class AddMobileExchangeTicketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Mobile Exchange Ticket', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: <Widget>[
          buildExchangeItem(context, 'asset/img/snack.png', '7,500P'),
          buildExchangeItem(context, 'asset/img/cookies.png', '5,000P'),
          buildExchangeItem(context, 'asset/img/chocolate.png', '3,500P'),
          buildExchangeItem(context, 'asset/img/gift.png', '8,000P'),
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
              offset: Offset(2, 2), // Shadow direction: bottom right
            )
          ],
        ),
        child: TextButton.icon(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          label: Text('Go back', style: TextStyle(color: Colors.black)),
          onPressed: () {
            // Use Navigator.pushReplacement to navigate back to HomeScreen
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget buildExchangeItem(BuildContext context, String imagePath, String price) {
    return Container(
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
            child: Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
        ],
      ),
    );
  }
}