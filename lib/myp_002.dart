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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Privacy',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {}, // Implement edit functionality
                    child: Text('Edit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Button background color
                      foregroundColor: Colors.white, // Button text color
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              InfoField(label: 'Name', value: 'John Doe'),
              InfoField(label: 'Phone Number', value: '123-456-7890'),
              InfoField(label: 'Email', value: 'john.doe@example.com'),
              SizedBox(height: 20),
              Text('My Mileage',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              buildMileageInfo(),
              SizedBox(height: 20),
              Text('My Exchange Ticket',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add, color: Colors.white),
                label: Text('Add Mobile Exchange Ticket'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  label: Text('Go back'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMileageInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 1.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.yellowAccent),
          SizedBox(width: 10),
          Text('10,000P', style: TextStyle(color: Colors.black, fontSize: 16)),
        ],
      ),
    );
  }
}

class InfoField extends StatelessWidget {
  final String label;
  final String value;

  const InfoField({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 1.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
