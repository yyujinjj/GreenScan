import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'mainscreen.dart'; // Make sure to import your MainScreen

void main() => runApp(const MaterialApp(home: TrashSeparationApp()));

class TrashSeparationApp extends StatelessWidget {
  const TrashSeparationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Separate the Trash',
      home: BatteryScreen(),
    );
  }
}

class BatteryScreen extends StatelessWidget {
  const BatteryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Separate the Trash',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green[800]!, width: 3),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Battery',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '폐건전지는 따로 분류해서 배출해야 해요. 폐건전지 수거함을 통해 배출해 주세요.\n 폐건전지를 일반 쓰레기로 배출 시 중금속(아연, 이산화망간, 흑연, 염화암모늄, 니켈, 카드뮴 등)으로 인해 지하수 수질을 오염시키고 땅을 황폐화시켜요. 일반쓰레기로 버려 소각하게 된다면 그 과정에서 폭발이 일어날 수도 있어요.\n건전지를 안전하게 분리배출 시에는 성분의 95%를 재활용하여 아연, 마그네슘 등 유용한 금속자원을 회수할 수 있어요.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Adjust the height for more space
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton.icon(
                  icon: Icon(Icons.arrow_back, color: Colors.black54),
                  label:
                      Text('Go Back', style: TextStyle(color: Colors.black54)),
                  onPressed: () {
                    // Navigate back to MainScreen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
