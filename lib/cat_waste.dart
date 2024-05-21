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
      home: WasteScreen(),
    );
  }
}

class WasteScreen extends StatelessWidget {
  const WasteScreen({super.key});

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
                      'Waste',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '재활용품이 아닌 일반쓰레기는 종량제 봉투에 넣어 버려요. 쓰레기 종량제 봉투는 주변 마트, 슈퍼, 편의점 등에서 구매할 수 있어요. 정확한 정보는 내가 사는 지역의 자치구 홈페이지에 들어가서 "종량제 봉투 판매소"를 검색하면 확인할 수 있어요. 크기는 5L, 10L, 20L, 30L, 50L, 75L가 있어요.\n\n종량제 봉투에 배출해야 하는 종류 :\n 치킨 상자 속 기름종이, 미세척된 컵라면이나 컵밥 용기, 음식물이나 스티커 등 이물질을 제거할 수 없는 비닐, 식탁보, 이불 커버, 은박비닐, 과일 망, 과일 포장재, 보온보냉팩, 도자기류, 사기그릇, 폐휴지, 기저귀, 기타 오염된 종이나 영수증, 사진, 코팅지, 부직포, 고무장갑, 슬리퍼, 칫솔, 볼펜, 샤프, 빨대, CD/DVD\n\n· 마요네즈나 케찹통, 기름통 등은 남은 음식물을 비워낸 뒤 제대로 씻어 말리면 재활용이 가능해요.\n· 자기류는 불연성 쓰레기로 종량제 봉투와는 별개로 분리 배출해야 하니 주의해야 해요.\n· 노끈은 제품마다 재질이 다양해 재활용과정에서 구분이 어려워 종량제 봉투에 담아 버리는 것이 좋아요.\n· 깨진 병이나 조명기구용 유리 등은 수거과정에서 다치지 않도록 신문지로 포장해 종량제 봉투에 버려야 해요.\n· 고흡성수지 아이스팩은 전용수거함이 없는 경우 종량제 봉투에 담아 버려야 해요.',
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
