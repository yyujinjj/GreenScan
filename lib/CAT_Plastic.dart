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
      home: PlasticScreen(),
    );
  }
}

class PlasticScreen extends StatelessWidget {
  const PlasticScreen({super.key});

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
                  children: [
                    const Text(
                      'PLASTIC',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '· 투명 페트병: 투명 페트병의 내용물을 비워요. 라벨을 제거하고 비닐류에 따로 버려요. 부피를 줄이기 위해 페트병을 찌그러트려요. 이물질이 들어가지 않도록 뚜껑을 닫아줘요. 무색 페트병과 유색 페트병을 별도로 분리하여 배출해요.\n· 1회용 컵은 투명 페트병 수거함에 들어가면 안돼요. 1회용 컵은 컵마다 재질도 다를뿐더러, 투명을 더럽히는 각각의 프린트가 있기 때문에 일반 플라스틱으로 배출해요.\n· 배달 음식을 먹고 난 플라스틱 용기는 양념 자국이 남은 경우 일반쓰레기로 분류돼요. 깨끗하게 세척하고 물기를 잘 말리면 플라스틱류로 분리배출할 수 있어요. 단, 플라스틱 용기에 붙은 비닐은 전부 뜯어서 분류해야 해요.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'asset/img/plastic_type.png',  // Ensure the asset path is correct.
                        width: MediaQuery.of(context).size.width * 1.0,
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