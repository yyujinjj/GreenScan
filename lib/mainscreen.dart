import 'package:flutter/material.dart';
import 'package:green/CAT_Battery.dart';
import 'package:green/CAT_Etc.dart';
import 'package:green/CAT_Lamp.dart';
import 'package:green/CAT_Metal.dart';
import 'package:green/MOCH_002.dart';
import 'CAT_Can.dart';
import 'CAT_Paper.dart';
import 'CAT_Plastic.dart';
import 'CAT_PlasticWaste.dart';
import 'CAT_Styrofoam.dart';
import 'CAT_Waste.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Separate the Trash',
      home: const HomeScreen(),
      routes: {
        '/waste': (context) => WasteScreen(),
        '/plastic': (context) => PlasticScreen(),
        '/plastic waste': (context) => PlasticWasteScreen(),
        '/styrofoam': (context) => StyrofoamScreen(),
        '/paper': (context) => PaperScreen(),
        '/can': (context) => CanScreen(),
        '/metal': (context) => ScrapMetalScreen(),
        '/lamp': (context) => FluorescentLampScreen(),
        '/battery': (context) => BatteryScreen(),
        '/etc': (context) => EtcScreen(),
        '/mypage': (context) => MyPage()
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Separate the Trash', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20), // Extra space above "MY PAGE"
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.lightGreen, // foreground
              minimumSize: const Size(420, 50),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/mypage'); // Navigation to MyPage
            },
            child: const Text('MY PAGE'),
          ),
          const SizedBox(height: 10), // Space below "MY PAGE"
          Row( // Row for grey icons
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 200,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Light grey color for the background
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: Image.asset('asset/img/camera.png'), // Placeholder Icon
              ),
              Container(
                width: 200,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Light grey color for the background
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: Image.asset('asset/img/ruler.png'), // Placeholder Icon
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                List<String> routes = ['/waste', '/plastic', '/plastic waste', '/styrofoam', '/paper', '/can', '/metal', '/lamp', '/battery', '/etc'];
                return GestureDetector(
                  onTap: () {
                    if (index < routes.length) {
                      Navigator.pushNamed(context, routes[index]);
                    }
                  },
                  child: GridTile(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'asset/img/Category$index.png',
                              fit: BoxFit.contain,
                              width: 140,
                              height: 115,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Column( // Column for vertically aligned buttons
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.lightGreen, // foreground
                  minimumSize: const Size(420, 50),
                ),
                onPressed: () {},
                child: const Text('LARGE WASTE'),
              ),
              const SizedBox(height: 10), // Space between buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.lightGreen, // foreground
                  minimumSize: const Size(420, 50),
                ),
                onPressed: () {},
                child: const Text('GAME'),
              ),
            ],
          ),
          const SizedBox(height: 10), // Padding at the bottom
        ],
      ),
    );
  }
}