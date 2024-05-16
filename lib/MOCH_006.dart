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
          buildExchangeItem(context, 'asset/img/snack.png', '7,500P', 'Snack'),
          buildExchangeItem(context, 'asset/img/cookies.png', '5,000P', 'Cookies'),
          buildExchangeItem(context, 'asset/img/chocolate.png', '3,500P', 'Chocolate'),
          buildExchangeItem(context, 'asset/img/gift.png', '8,000P', 'Gift'),
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
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget buildExchangeItem(BuildContext context, String imagePath, String price, String itemName) {
    return GestureDetector(
      onTap: () {
        showExchangeDialog(context, imagePath, itemName, price);
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
              child: Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  void showExchangeDialog(BuildContext context, String imagePath, String itemName, String price) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.lightBlue[100],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0), side: BorderSide(color: Colors.blue)),
          title: Column(
            children: <Widget>[
              Image.asset(imagePath, width: 100, height: 100),
              Text('Would you like to exchange for this product?', textAlign: TextAlign.center),
            ],
          ),
          content: Text(
            "You can't exchange it\nbecause you don't have enough mileage.",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.grey,
              ),
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}