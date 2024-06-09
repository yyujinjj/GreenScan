import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(GreenScanGame());
}

class GreenScanGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Scan Mini Game',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('그린 스캔 미니 게임'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectLevel()),
                );
              },
              child: Text('게임 시작'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('종료'),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('레벨 선택'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Level ${index + 1}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PlayGame(level: index + 1)),
              );
            },
          );
        },
      ),
    );
  }
}

class PlayGame extends StatefulWidget {
  final int level;
  PlayGame({required this.level});
  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  double truckPosition = 0.5;
  int score = 0;
  int maxWaste = 0;
  List<Waste> wastes = [];
  double fallSpeed = 0.3; // Base fall speed in cm/s adjusted by level

  @override
  void initState() {
    super.initState();
    maxWaste = (20 * pow(1.3, widget.level - 1)).round();
    fallSpeed *= pow(1.2, widget.level - 1);
    startWasteDrop();
  }

  void startWasteDrop() {
    for (int i = 0; i < maxWaste; i++) {
      double dropPosition = Random().nextDouble();
      Timer(Duration(seconds: i), () => createWaste(dropPosition));
    }
  }

  void createWaste(double position) {
    Waste waste = Waste(
      dropPosition: position,
      fallSpeed: fallSpeed,
      screenHeight: MediaQuery.of(context).size.height,
      iconData: Icons.delete, // Default icon, change as needed
    );
    setState(() {
      wastes.add(waste);
    });
    waste.dropWaste(onCatch: () {
      setState(() {
        score += 10;
        showScoreDialog('+10 점');
      });
    }, onMiss: () {
      setState(() {
        score -= 5;
        showScoreDialog('-5 점');
      });
    });
  }

  void showScoreDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('점수 변경'),
          content: Text('$message\n총점: $score'),
          actions: <Widget>[
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void moveTruck(double delta) {
    setState(() {
      truckPosition += delta;
      if (truckPosition > 1.0) truckPosition = 1.0;
      if (truckPosition < 0.0) truckPosition = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('레벨 ${widget.level} 게임'),
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          moveTruck(details.primaryDelta! / MediaQuery.of(context).size.width);
        },
        child: Stack(
          children: [
            for (var waste in wastes)
              Positioned(
                left:
                    MediaQuery.of(context).size.width * waste.dropPosition - 20,
                top: waste.verticalPosition,
                child: Icon(waste.iconData, size: 50),
              ),
            Positioned(
              left: MediaQuery.of(context).size.width * truckPosition - 25,
              bottom: 20,
              child: Icon(Icons.local_shipping, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}

class Waste {
  double dropPosition;
  double verticalPosition = 0.0;
  double fallSpeed;
  double screenHeight;
  IconData iconData;

  Waste({
    required this.dropPosition,
    required this.fallSpeed,
    required this.screenHeight,
    required this.iconData,
  });

  void dropWaste({required Function onCatch, required Function onMiss}) {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      verticalPosition += fallSpeed * 5; // Increase drop speed

      if (verticalPosition >= screenHeight - 70) {
        timer.cancel();
        if (dropPosition >= 0.4 && dropPosition <= 0.6) {
          onCatch();
        } else {
          onMiss();
        }
      }
    });
  }
}

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:math';

// class GameScreen extends StatefulWidget {
//   final int level;
//   GameScreen({required this.level});

//   @override
//   _GameScreenState createState() => _GameScreenState();
// }

// class _GameScreenState extends State<GameScreen> {
//   bool isPaused = false;
//   List<FallingObject> fallingObjects = [];
//   Timer? gameTimer;
//   int life = 5;
//   int score = 0;
//   int totalObjects = 0;
//   int correctAnswers = 0;

//   @override
//   void initState() {
//     super.initState();
//     startGame();
//   }

//   void startGame() {
//     double speed = 0.3 * pow(1.2, widget.level - 1);
//     totalObjects = (20 * pow(1.3, widget.level - 1)).toInt();

//     gameTimer =
//         Timer.periodic(Duration(milliseconds: (1000 / speed).toInt()), (timer) {
//       if (!isPaused) {
//         setState(() {
//           if (fallingObjects.length < totalObjects) {
//             fallingObjects.add(FallingObject(_getRandomTrashType()));
//           }
//           for (var obj in fallingObjects) {
//             obj.updatePosition();
//           }
//           checkCollision();
//         });
//       }
//     });
//   }

//   TrashType _getRandomTrashType() {
//     int rand = Random().nextInt(5);
//     switch (rand) {
//       case 0:
//         return TrashType.general;
//       case 1:
//         return TrashType.food;
//       case 2:
//         return TrashType.plastic;
//       case 3:
//         return TrashType.can;
//       case 4:
//         return TrashType.glass;
//       default:
//         return TrashType.general;
//     }
//   }

//   void checkCollision() {
//     for (var obj in fallingObjects) {
//       if (obj.y > MediaQuery.of(context).size.height - 100) {
//         setState(() {
//           fallingObjects.remove(obj);
//           life--;
//         });
//         if (life == 0) {
//           gameTimer?.cancel();
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => GameOverScreen(
//                     score: score, level: widget.level, success: false)),
//           );
//         }
//       }
//     }
//   }

//   void togglePause() {
//     setState(() {
//       isPaused = !isPaused;
//     });
//   }

//   @override
//   void dispose() {
//     gameTimer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('LV.${widget.level}'),
//         actions: [
//           IconButton(
//             icon: Icon(isPaused ? Icons.play_arrow : Icons.pause),
//             onPressed: togglePause,
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           ...fallingObjects.map((obj) => Positioned(
//                 left: obj.x,
//                 top: obj.y,
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (obj.isCorrect) {
//                         score += 10;
//                         correctAnswers++;
//                       } else {
//                         score -= 5;
//                       }
//                       fallingObjects.remove(obj);
//                     });

//                     if (correctAnswers == totalObjects) {
//                       gameTimer?.cancel();
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => GameOverScreen(
//                                 score: score,
//                                 level: widget.level,
//                                 success: true)),
//                       );
//                     }
//                   },
//                   child: Icon(obj.icon,
//                       color: obj.isCorrect ? Colors.green : Colors.red),
//                 ),
//               )),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Image.asset('assets/truck.png'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FallingObject {
//   double x = Random().nextDouble() * 300;
//   double y = 0;
//   double speed = Random().nextDouble() * 3 + 1;
//   TrashType type;
//   IconData icon;
//   bool isCorrect;

//   FallingObject(this.type)
//       : icon = _getIconForTrashType(type),
//         isCorrect = (type == TrashType.paper);

//   void updatePosition() {
//     y += speed;
//   }

//   static IconData _getIconForTrashType(TrashType type) {
//     switch (type) {
//       case TrashType.general:
//         return Icons.delete;
//       case TrashType.food:
//         return Icons.restaurant;
//       case TrashType.plastic:
//         return Icons.local_drink;
//       case TrashType.can:
//         return Icons.local_bar;
//       case TrashType.glass:
//         return Icons.wine_bar;
//       case TrashType.paper:
//         return Icons.description;
//       default:
//         return Icons.help;
//     }
//   }
// }

// enum TrashType { general, food, plastic, can, glass, paper }

// class GameOverScreen extends StatelessWidget {
//   final int score;
//   final int level;
//   final bool success;

//   GameOverScreen(
//       {required this.score, required this.level, required this.success});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Game Over'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(success ? 'Success!' : 'Fail', style: TextStyle(fontSize: 24)),
//             Text('Score: $score', style: TextStyle(fontSize: 24)),
//             Text('Level: $level', style: TextStyle(fontSize: 24)),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.popUntil(
//                     context, ModalRoute.withName(Navigator.defaultRouteName));
//               },
//               child: Text('Go to Home'),
//             ),
//             if (!success)
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => GameScreen(level: level)),
//                   );
//                 },
//                 child: Text('Retry'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
