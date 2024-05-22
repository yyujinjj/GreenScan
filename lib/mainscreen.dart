import 'package:cap/login.dart';
import 'package:flutter/material.dart';
import 'package:cap/cat_battery.dart' as battery_cat;
import 'package:cap/cat_etc.dart' as etc_cat;
import 'package:cap/cat_lamp.dart' as lamp_cat;
import 'package:cap/cat_metal.dart' as metal_cat;
import 'package:cap/moch.dart';
import 'package:cap/cat_can.dart' as can_cat;
import 'package:cap/cat_paper.dart' as paper_cat;
import 'package:cap/cat_plastic.dart' as plastic_cat;
import 'package:cap/cat_plasticwaste.dart' as plasticwaste_cat;
import 'package:cap/cat_styrofoam.dart' as styrofoam_cat;
import 'package:cap/cat_waste.dart' as waste_cat;

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
      home: const LoginScreen(),
      routes: {
        '/waste': (context) => waste_cat.WasteScreen(),
        '/plastic': (context) => plastic_cat.PlasticScreen(),
        '/plastic waste': (context) => plasticwaste_cat.PlasticWasteScreen(),
        '/styrofoam': (context) => styrofoam_cat.StyrofoamScreen(),
        '/paper': (context) => paper_cat.PaperScreen(),
        '/can': (context) => can_cat.CanScreen(),
        '/metal': (context) => metal_cat.ScrapMetalScreen(),
        '/lamp': (context) => lamp_cat.FluorescentLampScreen(),
        '/battery': (context) => battery_cat.BatteryScreen(),
        '/etc': (context) => etc_cat.EtcScreen(),
        '/mypage': (context) =>
            MyPage() // 이 부분에 대한 import가 누락되었으므로 해당 파일을 확인해야 합니다.
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
        title: const Text('Separate the Trash',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20), // Extra space above "MY PAGE"
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.lightGreen,
              minimumSize: const Size(420, 50),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/mypage');
            },
            child: const Text('MY PAGE'),
          ),
          const SizedBox(height: 10), // Space below "MY PAGE"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 200,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/camera.png'),
              ),
              Container(
                width: 200,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/ruler.png'),
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
                List<String> routes = [
                  '/waste',
                  '/plastic',
                  '/plastic waste',
                  '/styrofoam',
                  '/paper',
                  '/can',
                  '/metal',
                  '/lamp',
                  '/battery',
                  '/etc'
                ];
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
                            child: Image.asset('assets/Category$index.png',
                                fit: BoxFit.contain, width: 140, height: 115),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightGreen,
                  minimumSize: const Size(420, 50),
                ),
                onPressed: () {},
                child: const Text('LARGE WASTE'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightGreen,
                  minimumSize: const Size(420, 50),
                ),
                onPressed: () {},
                child: const Text('GAME'),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
