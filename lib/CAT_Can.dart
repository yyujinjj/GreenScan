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
      home: CanScreen(),
    );
  }
}

class CanScreen extends StatelessWidget {
  const CanScreen({super.key});

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
                      'Can',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '알루미늄 캔 재활용 시 납작하게 부피를 줄여 분리수거 해주세요. 발로 밟을 시 안전에 주의하세요.세로로 세워서 납작하게 줄이지 않고 눕혀서 옆면을 밟아 부피도 줄이고 선별에도 문제가 되지 않게 해주세요.\n캔 고리는 따로 떼어내지 않고 함께 배출해주세요.\n참치나 햄 같은 음식물에 사용되는 캔은 물로 깨끗이 씻은 후 배출해주세요.\n부탄가스나 헤어스프레이 같은 캔은 구멍을 뚫어 분리수거 해주세요. 압축된 내부의 압력 때문에 폭발의 위험성이 있으니 반드시 장갑을 끼고 구멍을 뚫어 잔여 가스가 사라지도록 해야 해요.\n\n캔류 예) 부탄가스, 화기용 가스, 참치캔, 스팸, 과일 등 가공식품/ 통조림 캔, 시중 모든 음료, 맥주 캔 등',
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