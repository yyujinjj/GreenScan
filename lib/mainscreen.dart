import 'package:flutter/material.dart';
import 'package:cap/cat_battery.dart' as battery_cat;
import 'package:cap/cat_etc.dart' as etc_cat;
import 'package:cap/cat_lamp.dart' as lamp_cat;
import 'package:cap/cat_metal.dart' as metal_cat;
import 'package:cap/moch.dart' as moch;
import 'package:cap/cat_can.dart' as can_cat;
import 'package:cap/cat_paper.dart' as paper_cat;
import 'package:cap/cat_plastic.dart' as plastic_cat;
import 'package:cap/cat_plasticwaste.dart' as plasticwaste_cat;
import 'package:cap/cat_styrofoam.dart' as styrofoam_cat;
import 'package:cap/cat_waste.dart' as waste_cat;
import 'package:cap/was.dart';
import 'package:cap/myp.dart' as myp;
import 'package:cap/camera.dart' as camera;

class MyAppp extends StatelessWidget {
  const MyAppp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Separate the Trash',
      home: const HomeScreen(),
      routes: {
        '/camera': (context) => camera.CameraExample(),
        '/waste': (context) => waste_cat.WasteScreen(),
        '/plastic': (context) => plastic_cat.PlasticScreen(),
        '/plastic_waste': (context) => plasticwaste_cat.PlasticWasteScreen(),
        '/styrofoam': (context) => styrofoam_cat.StyrofoamScreen(),
        '/paper': (context) => paper_cat.PaperScreen(),
        '/can': (context) => can_cat.CanScreen(),
        '/metal': (context) => metal_cat.ScrapMetalScreen(),
        '/lamp': (context) => lamp_cat.FluorescentLampScreen(),
        '/battery': (context) => battery_cat.BatteryScreen(),
        '/etc': (context) => etc_cat.EtcScreen(),
        '/mypage': (context) => myp.MyPage(), // 명확히 구분하여 사용
        '/largeWaste': (context) => CategorySelectionScreen(),
        '/addMobileExchangeTicket': (context) =>
            moch.AddMobileExchangeTicketPage(),
        '/identityVerification': (context) =>
            myp.IdentityVerificationScreen(), // 추가된 라우트
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.3;
    final buttonWidth = screenWidth * 0.9;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Separate the Trash',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.lightGreen,
              minimumSize: Size(buttonWidth, 50),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/mypage');
            },
            child: const Text('MY PAGE'),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/camera');
                },
                child: Container(
                  width: iconSize,
                  height: iconSize * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset('assets/camera.png'),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: iconSize,
                  height: iconSize * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset('assets/ruler.png'),
                ),
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
                  '/plastic_waste',
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
                                fit: BoxFit.contain,
                                width: iconSize,
                                height: iconSize * 0.8),
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
                  minimumSize: Size(buttonWidth, 50),
                ),
                onPressed: () => Navigator.pushNamed(context, '/largeWaste'),
                child: const Text('LARGE WASTE'),
              ),
              const SizedBox(height: 10),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
