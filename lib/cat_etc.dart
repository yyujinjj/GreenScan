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
      home: EtcScreen(),
    );
  }
}

class EtcScreen extends StatelessWidget {
  const EtcScreen({super.key});

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
                      'Etc',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '유리병의 이물질을 깨끗이 씻고 뚜껑을 닫은 체 배출해주세요. 뚜껑을 닫아 유리병 입구의 손상을 막을 수 있어요.\n소주 병이나 맥주병은 마트에 가면 빈 병 보증금 반환제도를 통해 다시 환불을 받을 수 있어요, 소주병 뒷면에 100원 환불 가능한 표시가 되어 있어요.\n\n음식물쓰레기 vs 일반쓰레기 구별법\n딱딱한 것들은 일반쓰레기에 해당해요.\n예) 견과류의 껍질, 게 껍질, 소, 돼지, 치킨의 뼈, 어패류 껍데기와 생선 가시, 계란 껍데기, 핵과류 씨앗 등\n찌꺼기는 일반쓰레기에요.\n녹차찌꺼기, 한약재 찌꺼기, 미나리나 파뿌리, 마늘대 등\n헷갈리는 것들\n음식물쓰레기: 바나나, 귤, 오렌지, 사과, 수박, 멜론, 망고 껍질 등\n일반쓰레기: 콩, 양파, 마늘, 옥수수, 파인애플 껍질 등',
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
