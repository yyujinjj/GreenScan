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
      home: PlasticWasteScreen(),
    );
  }
}

class PlasticWasteScreen extends StatelessWidget {
  const PlasticWasteScreen({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green[800]!, width: 3),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Plastic Waste',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '비닐은 종류와 색상에 관계없이 비닐류 분리배출 가능해요.\n지퍼백은 지퍼부분을 따로 제거하지 않고 비닐류에 배출해요.\n비닐에 스티커나 테이프가 붙어있을 경우 모두 떼거나 잘라낸 후 비닐만 분리수거 해요. 이물질 제거가 어렵다면 일반쓰레기로 배출해요.\n배달할 때 업소에서 음식물이 새지 않게 보호하는 비닐 등의 업소용 랩 및 소시지가 포장된 비닐은 분리배출이 불가능해요.\n아이스팩은 일반쓰레기이나 친환경 제품인 경우 내용물을 싱크대로 흘려보내고 포장재는 비닐류에 배출해요.\n\n비닐류 분리배출 가능 예) 라면봉지, 과자봉지, 믹스커피와 같은 개별 포장 봉지, 빵 등 식제품에서 나오는 비닐 포장재, 가정용 랩, 에어캡(뽁뽁이), 지퍼백, 페트병 라벨 등\n비닐류 분리배출 불가능 예) 업소용 랩, 테이프, 송장, 아이스팩 등',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
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
                    label: Text('Go Back',
                        style: TextStyle(color: Colors.black54)),
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
      ),
    );
  }
}
