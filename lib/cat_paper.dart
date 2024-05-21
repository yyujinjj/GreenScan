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
      home: PaperScreen(),
    );
  }
}

class PaperScreen extends StatelessWidget {
  const PaperScreen({super.key});

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
                  children: [
                    const Text(
                      'PAPER',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '· 비나 물에 젖지 않아야 해요.\n· 비닐 코팅이 된 광고 전단지가 섞이지 않아야 해요.\n  (겉 부분에 얇은 비닐 코팅막이 있으면 X)\n· 코팅 여부가 헷갈리면 손으로 쉽게 찢어지는 종이를 분리수거해요.\n· 비닐코팅 표지, 스프링, 스테플러 심, 운송장, 비닐 테이프 등을 제거 후 배출해요.\n·신문이나 낱장의 종이는 날리지 않도록 모아서 배출해요.\n· 분쇄된 종잇조각(파지)는 종량제 봉투에 넣어 버려요.\n· 종이컵, 종이팩, 멸균팩은 다른 종이류와 ‘섞이지 않게’ 배출해요.\n·종이팩은 액체를 보관할 수 있도록 종이 안과 밖에 다른 재질이 붙어 있어 별도로 분리해 배출해요. 물로 안쪽을 헹궈 남은 음식물을 씻어낸 뒤 펼쳐 말려요. 종이팩 수거함이 있다면 수거함에, 별도 수거함이 없다면 따로 모아 묶은 뒤 종이류로 배출해요.\n· 종량제 봉투에 버릴 종이류 :\n  영수증, 은박지, 벽지, 나염지, 인화지, 부직포, 기름종이(트레이싱지), 식품용 유산지, 일회용 기저귀나 생리대, 사용한 휴지',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/trash_paper.png', // Ensure the asset path is correct.
                        width: MediaQuery.of(context).size.width * 0.2,
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
