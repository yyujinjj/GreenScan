import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'mainscreen.dart';  // Make sure to import your MainScreen

void main() => runApp(const MaterialApp(home: TrashSeparationApp()));

class TrashSeparationApp extends StatelessWidget {
  const TrashSeparationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Separate the Trash',
      home: ScrapMetalScreen(),
    );
  }
}

class ScrapMetalScreen extends StatelessWidget {
  const ScrapMetalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Separate the Trash', style: TextStyle(color: Colors.white)),
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
                      'Scrap Metal',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '고철에 음식물이 묻어 있는 경우 깨끗이 씻은 후 배출해주세요.\n스테인리스 조리 용품은 캔류로 분리하여 배출해야 해요.\n고철류는 다양한 크기와 종류가 있어 재활용을 위해 끈으로 묶거나 투명 비닐에 담아 배출해주세요.\n\n고철류 예) 냄비, 프라이팬, 주전자, 니퍼, 펜치, 못, 전선, 옷걸이, 열쇠 등',
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
                  label: Text('Go Back', style: TextStyle(color: Colors.black54)),
                  onPressed: () {
                    // Navigate back to MainScreen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
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