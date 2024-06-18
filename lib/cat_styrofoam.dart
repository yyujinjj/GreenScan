import 'package:flutter/material.dart';
import 'mainscreen.dart';

void main() => runApp(const MaterialApp(home: TrashSeparationApp()));

class TrashSeparationApp extends StatelessWidget {
  const TrashSeparationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Separate the Trash',
      home: StyrofoamScreen(),
    );
  }
}

class StyrofoamScreen extends StatelessWidget {
  const StyrofoamScreen({super.key});

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
                      'Styrofoam',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '스티로폼 박스 안의 내용물을 모두 비우고, 음식물 등의 이물질이 묻어있을 경우 물로 깨끗이 세척한 후 분리 배출해요.\n박스에 붙어있는 택배송장, 테이프, 스티커는 완전히 떼어내서 일반쓰레기로 버려요.\n정육점에서 사용하는 스티로폼 트레이처럼 무늬와 색상이 있거나 비닐이 코팅된 스티로폼은 재활용이 불가능하니 일반쓰레기로 버려주세요.\n사과, 배 등의 과일 개별 포장에 쓰이는 스티로폼은 재활용 가치가 낮아 모두 폐기된다고 하니 일반쓰레기로 버려주세요.\n일회용 접시, 컵라면 용기 등의 스티로폼은 음식물이 완전히 제거되어 흰색 스티로폼 상태여야만 재활용이 가능해요. 음식물을 깨끗이 씻어낸 후 배출하고, 씻어도 완전히 제거되지 않으면 일반쓰레기로 버려주세요.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
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
