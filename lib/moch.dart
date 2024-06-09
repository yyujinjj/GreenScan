// import 'package:flutter/material.dart';
// import 'mainscreen.dart'; // Ensure HomeScreen is defined in mainscreen.dart

// void main() {
//   runApp(TrashSeparationApp());
// }

// class TrashSeparationApp extends StatelessWidget {
//   const TrashSeparationApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Separate the Trash',
//       home: MobileScreen(),
//       routes: {
//         '/home': (context) => HomeScreen(),
//         '/addMobileExchangeTicket': (context) => AddMobileExchangeTicketPage(),
//       },
//     );
//   }
// }

// class MobileScreen extends StatelessWidget {
//   const MobileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: const Text('Separate the Trash',
//             style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: const [
//           _NavigationButton(title: 'Battery', screen: BatteryScreen()),
//           _NavigationButton(title: 'Can', screen: CanScreen()),
//           _NavigationButton(title: 'Etc', screen: EtcScreen()),
//           _NavigationButton(
//               title: 'Fluorescent Lamp', screen: FluorescentLampScreen()),
//           _NavigationButton(title: 'Scrap Metal', screen: ScrapMetalScreen()),
//           _NavigationButton(title: 'Paper', screen: PaperScreen()),
//           _NavigationButton(title: 'Plastic', screen: PlasticScreen()),
//           _NavigationButton(
//               title: 'Plastic Waste', screen: PlasticWasteScreen()),
//           _NavigationButton(title: 'Styrofoam', screen: StyrofoamScreen()),
//           _NavigationButton(title: 'Waste', screen: WasteScreen()),
//         ],
//       ),
//     );
//   }
// }

// class _NavigationButton extends StatelessWidget {
//   final String title;
//   final Widget screen;

//   const _NavigationButton(
//       {required this.title, required this.screen, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.all(16.0),
//           backgroundColor: Colors.green,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//         ),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => screen),
//           );
//         },
//         child: Text(title, style: const TextStyle(fontSize: 18)),
//       ),
//     );
//   }
// }

// class BatteryScreen extends StatelessWidget {
//   const BatteryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _InfoScreen(
//       title: 'Battery',
//       description:
//           '폐건전지는 따로 분류해서 배출해야 해요. 폐건전지 수거함을 통해 배출해 주세요.\n 폐건전지를 일반 쓰레기로 배출 시 중금속(아연, 이산화망간, 흑연, 염화암모늄, 니켈, 카드뮴 등)으로 인해 지하수 수질을 오염시키고 땅을 황폐화시켜요. 일반쓰레기로 버려 소각하게 된다면 그 과정에서 폭발이 일어날 수도 있어요.\n건전지를 안전하게 분리배출 시에는 성분의 95%를 재활용하여 아연, 마그네슘 등 유용한 금속자원을 회수할 수 있어요.',
//     );
//   }
// }

// class CanScreen extends StatelessWidget {
//   const CanScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _InfoScreen(
//       title: 'Can',
//       description:
//           '알루미늄 캔 재활용 시 납작하게 부피를 줄여 분리수거 해주세요. 발로 밟을 시 안전에 주의하세요.세로로 세워서 납작하게 줄이지 않고 눕혀서 옆면을 밟아 부피도 줄이고 선별에도 문제가 되지 않게 해주세요.\n캔 고리는 따로 떼어내지 않고 함께 배출해주세요.\n참치나 햄 같은 음식물에 사용되는 캔은 물로 깨끗이 씻은 후 배출해주세요.\n부탄가스나 헤어스프레이 같은 캔은 구멍을 뚫어 분리수거 해주세요. 압축된 내부의 압력 때문에 폭발의 위험성이 있으니 반드시 장갑을 끼고 구멍을 뚫어 잔여 가스가 사라지도록 해야 해요.\n\n캔류 예) 부탄가스, 화기용 가스, 참치캔, 스팸, 과일 등 가공식품/ 통조림 캔, 시중 모든 음료, 맥주 캔 등',
//     );
//   }
// }

// class EtcScreen extends StatelessWidget {
//   const EtcScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _InfoScreen(
//       title: 'Etc',
//       description:
//           '유리병의 이물질을 깨끗이 씻고 뚜껑을 닫은 체 배출해주세요. 뚜껑을 닫아 유리병 입구의 손상을 막을 수 있어요.\n소주 병이나 맥주병은 마트에 가면 빈 병 보증금 반환제도를 통해 다시 환불을 받을 수 있어요, 소주병 뒷면에 100원 환불 가능한 표시가 되어 있어요.\n\n음식물쓰레기 vs 일반쓰레기 구별법\n딱딱한 것들은 일반쓰레기에 해당해요.\n예) 견과류의 껍질, 게 껍질, 소, 돼지, 치킨의 뼈, 어패류 껍데기와 생선 가시, 계란 껍데기, 핵과류 씨앗 등\n찌꺼기는 일반쓰레기에요.\n녹차찌꺼기, 한약재 찌꺼기, 미나리나 파뿌리, 마늘대 등\n헷갈리는 것들\n음식물쓰레기: 바나나, 귤, 오렌지, 사과, 수박, 멜론, 망고 껍질 등\n일반쓰레기: 콩, 양파, 마늘, 옥수수, 파인애플 껍질 등',
//     );
//   }
// }

// class FluorescentLampScreen extends StatelessWidget {
//   const FluorescentLampScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _InfoScreen(
//       title: 'Fluorescent Lamp',
//       description:
//           '형광등은 깨지지 않게 조심하여 내피(포장)을 벗기어 배출하여야 해요.\n각 아파트 관리사무소, 혹은 동사무소에 비치된 폐형광등 수거함에 배출해요.\n만약 형광등이 깨졌다면 불연성 쓰레기 봉투에 담아 버려주시고, 깨진 형광등이 수거하는 사람을 다치게 할 수 있으니 쓰레기 봉투가 찢어지지 않게 신문지 등으로 잘 싸서 버려주세요.\n불연성 쓰레기 봉투는 지역 내 마트, 주민센터, 철물점 등에서 살 수 있어요. 하지만 안파는 곳도 많으니 판매여부를 미리 확인하고 방문하세요.\n불연성 쓰레기 봉투는 해당 지자체에 따라 불연재 쓰레기 봉투, 생활 폐기물 봉투, 특수 종량제 봉투 등으로 이름이 조금씩 다를 수 있어요. 모두 타지 않는 쓰레기를 담는 종량제 봉투라는 것과 마대 재질로 만들어졌다는 것을 기억해주세요.\n\n전구는 재활용이 불가능하고 불에 타지 않는 쓰레기이기 때문에 불연성 쓰레기 봉투에 넣어서 버려주세요.\n\nLED 전구나 LED 전등은 일반쓰레기로 버려요\nLED 조명은 대부분 플라스틱 재질이 쓰이지만 만약 유리가 포함되어 있다면 깨져서 수거하는 사람이 다칠 수 있으니 쓰레기 봉투가 찢어지지 않게 신문지 등으로 잘 싸서 버려주세요.',
//     );
//   }
// }

// class ScrapMetalScreen extends StatelessWidget {
//   const ScrapMetalScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _InfoScreen(
//       title: 'Scrap Metal',
//       description:
//           '고철에 음식물이 묻어 있는 경우 깨끗이 씻은 후 배출해주세요.\n스테인리스 조리 용품은 캔류로 분리하여 배출해야 해요.\n고철류는 다양한 크기와 종류가 있어 재활용을 위해 끈으로 묶거나 투명 비닐에 담아 배출해주세요.\n\n고철류 예) 냄비, 프라이팬, 주전자, 니퍼, 펜치, 못, 전선, 옷걸이, 열쇠 등',
//     );
//   }
// }

// class PaperScreen extends StatelessWidget {
//   const PaperScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _InfoScreen(
//       title: 'Paper',
//       description:
//           '· 비나 물에 젖지 않아야 해요.\n· 비닐 코팅이 된 광고 전단지가 섞이지 않아야 해요.\n  (겉 부분에 얇은 비닐 코팅막이 있으면 X)\n· 코팅 여부가 헷갈리면 손으로 쉽게 찢어지는 종이를 분리수거해요.\n· 비닐코팅 표지, 스프링, 스테플러 심, 운송장, 비닐 테이프 등을 제거 후 배출해요.\n·신문이나 낱장의 종이는 날리지 않도록 모아서 배출해요.\n· 분쇄된 종잇조각(파지)는 종량제 봉투에 넣어 버려요.\n· 종이컵, 종이팩, 멸균팩은 다른 종이류와 ‘섞이지 않게’ 배출해요.\n·종이팩은 액체를 보관할 수 있도록 종이 안과 밖에 다른 재질이 붙어 있어 별도로 분리해 배출해요. 물로 안쪽을 헹궈 남은 음식물을 씻어낸 뒤 펼쳐 말려요. 종이팩 수거함이 있다면 수거함에, 별도 수거함이 없다면 따로 모아 묶은 뒤 종이류로 배출해요.\n· 종량제 봉투에 버릴 종이류 :\n  영수증, 은박지, 벽지, 나염지, 인화지, 부직포, 기름종이(트레이싱지), 식품용 유산지, 일회용 기저귀나 생리대, 사용한 휴지',
//       imagePath: 'assets/trash_paper.png',
//     );
//   }
// }

// class PlasticScreen extends StatelessWidget {
//   const PlasticScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _InfoScreen(
//       title: 'Plastic',
//       description:
//           '· 투명 페트병: 투명 페트병의 내용물을 비워요. 라벨을 제거하고 비닐류에 따로 버려요. 부피를 줄이기 위해 페트병을 찌그러트려요. 이물질이 들어가지 않도록 뚜껑을 닫아줘요. 무색 페트병과 유색 페트병을 별도로 분리하여 배출해요.\n· 1회용 컵은 투명 페트병 수거함에 들어가면 안돼요. 1회용 컵은 컵마다 재질도 다를뿐더러, 투명을 더럽히는 각각의 프린트가 있기 때문에 일반 플라스틱으로 배출해요.\n· 배달 음식을 먹고 난 플라스틱 용기는 양념 자국이 남은 경우 일반쓰레기로 분류돼요. 깨끗하게 세척하고 물기를 잘 말리면 플라스틱류로 분리배출할 수 있어요. 단, 플라스틱 용기에 붙은 비닐은 전부 뜯어서 분류해야 해요.',
//       imagePath: 'assets/plastic_type.png',
//     );
//   }
// }

// class PlasticWasteScreen extends StatelessWidget {
//   const PlasticWasteScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _InfoScreen(
//       title: 'Plastic Waste',
//       description:
//           '비닐은 종류와 색상에 관계없이 비닐류 분리배출 가능해요.\n지퍼백은 지퍼부분을 따로 제거하지 않고 비닐류에 배출해요.\n비닐에 스티커나 테이프가 붙어있을 경우 모두 떼거나 잘라낸 후 비닐만 분리수거 해요. 이물질 제거가 어렵다면 일반쓰레기로 배출해요.\n배달할 때 업소에서 음식물이 새지 않게 보호하는 비닐 등의 업소용 랩 및 소시지가 포장된 비닐은 분리배출이 불가능해요.\n아이스팩은 일반쓰레기이나 친환경 제품인 경우 내용물을 싱크대로 흘려보내고 포장재는 비닐류에 배출해요.\n\n비닐류 분리배출 가능 예) 라면봉지, 과자봉지, 믹스커피와 같은 개별 포장 봉지, 빵 등 식제품에서 나오는 비닐 포장재, 가정용 랩, 에어캡(뽁뽁이), 지퍼백, 페트병 라벨 등\n비닐류 분리배출 불가능 예) 업소용 랩, 테이프, 송장, 아이스팩 등',
//     );
//   }
// }

// class StyrofoamScreen extends StatelessWidget {
//   const StyrofoamScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _InfoScreen(
//       title: 'Styrofoam',
//       description:
//           '스티로폼 박스 안의 내용물을 모두 비우고, 음식물 등의 이물질이 묻어있을 경우 물로 깨끗이 세척한 후 분리 배출해요.\n박스에 붙어있는 택배송장, 테이프, 스티커는 완전히 떼어내서 일반쓰레기로 버려요.\n정육점에서 사용하는 스티로폼 트레이처럼 무늬와 색상이 있거나 비닐이 코팅된 스티로폼은 재활용이 불가능하니 일반쓰레기로 버려주세요.\n사과, 배 등의 과일 개별 포장에 쓰이는 스티로폼은 재활용 가치가 낮아 모두 폐기된다고 하니 일반쓰레기로 버려주세요.\n일회용 접시, 컵라면 용기 등의 스티로폼은 음식물이 완전히 제거되어 흰색 스티로폼 상태여야만 재활용이 가능해요. 음식물을 깨끗이 씻어낸 후 배출하고, 씻어도 완전히 제거되지 않으면 일반쓰레기로 버려주세요.',
//     );
//   }
// }

// class WasteScreen extends StatelessWidget {
//   const WasteScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return _InfoScreen(
//       title: 'Waste',
//       description:
//           '재활용품이 아닌 일반쓰레기는 종량제 봉투에 넣어 버려요. 쓰레기 종량제 봉투는 주변 마트, 슈퍼, 편의점 등에서 구매할 수 있어요. 정확한 정보는 내가 사는 지역의 자치구 홈페이지에 들어가서 "종량제 봉투 판매소"를 검색하면 확인할 수 있어요. 크기는 5L, 10L, 20L, 30L, 50L, 75L가 있어요.\n\n종량제 봉투에 배출해야 하는 종류 :\n 치킨 상자 속 기름종이, 미세척된 컵라면이나 컵밥 용기, 음식물이나 스티커 등 이물질을 제거할 수 없는 비닐, 식탁보, 이불 커버, 은박비닐, 과일 망, 과일 포장재, 보온보냉팩, 도자기류, 사기그릇, 폐휴지, 기저귀, 기타 오염된 종이나 영수증, 사진, 코팅지, 부직포, 고무장갑, 슬리퍼, 칫솔, 볼펜, 샤프, 빨대, CD/DVD\n\n· 마요네즈나 케찹통, 기름통 등은 남은 음식물을 비워낸 뒤 제대로 씻어 말리면 재활용이 가능해요.\n· 자기류는 불연성 쓰레기로 종량제 봉투와는 별개로 분리 배출해야 하니 주의해야 해요.\n· 노끈은 제품마다 재질이 다양해 재활용과정에서 구분이 어려워 종량제 봉투에 담아 버리는 것이 좋아요.\n· 깨진 병이나 조명기구용 유리 등은 수거과정에서 다치지 않도록 신문지로 포장해 종량제 봉투에 버려야 해요.\n· 고흡성수지 아이스팩은 전용수거함이 없는 경우 종량제 봉투에 담아 버려야 해요.',
//     );
//   }
// }

// class _InfoScreen extends StatelessWidget {
//   final String title;
//   final String description;
//   final String? imagePath;

//   const _InfoScreen({
//     required this.title,
//     required this.description,
//     this.imagePath,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text(title, style: const TextStyle(color: Colors.white)),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.green[800]!, width: 3),
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       description,
//                       style: const TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                     if (imagePath != null) ...[
//                       const Spacer(),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Image.asset(
//                           imagePath!,
//                           width: MediaQuery.of(context).size.width * 0.8,
//                         ),
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: TextButton.icon(
//                   icon: const Icon(Icons.arrow_back, color: Colors.black54),
//                   label: const Text('Go Back',
//                       style: TextStyle(color: Colors.black54)),
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const MobileScreen()),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AddMobileExchangeTicketPage extends StatelessWidget {
//   const AddMobileExchangeTicketPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Mobile Exchange Ticket',
//             style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.green,
//       ),
//       body: GridView.count(
//         padding: const EdgeInsets.all(20),
//         crossAxisCount: 2,
//         crossAxisSpacing: 20,
//         mainAxisSpacing: 20,
//         children: <Widget>[
//           buildExchangeItem(context, 'assets/snack.png', '7,500P', 'Snack'),
//           buildExchangeItem(context, 'assets/cookies.png', '5,000P', 'Cookies'),
//           buildExchangeItem(
//               context, 'assets/chocolate.png', '3,500P', 'Chocolate'),
//           buildExchangeItem(context, 'assets/gift.png', '8,000P', 'Gift'),
//         ],
//       ),
//     );
//   }

//   Widget buildExchangeItem(
//       BuildContext context, String imagePath, String price, String itemName) {
//     return GestureDetector(
//       onTap: () {
//         showExchangeDialog(context, imagePath, itemName, price,
//             false); // initially set incorrect to false
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.black),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image.asset(imagePath, fit: BoxFit.contain),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(price,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void showExchangeDialog(BuildContext context, String imagePath,
//       String itemName, String price, bool incorrect) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.lightBlue[100],
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.0),
//               side: BorderSide(color: Colors.blue)),
//           title: Column(
//             children: <Widget>[
//               Image.asset(imagePath, width: 100, height: 100),
//               Text('Would you like to exchange for this product?',
//                   textAlign: TextAlign.center),
//             ],
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               if (incorrect)
//                 Text(
//                   "Personal information was entered incorrectly.\nWould you like to re-enter? (1/5)",
//                   style: TextStyle(color: Colors.red),
//                   textAlign: TextAlign.center,
//                 ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'ID',
//                   border: OutlineInputBorder(),
//                   fillColor: Colors.white,
//                   filled: true,
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                   fillColor: Colors.white,
//                   filled: true,
//                 ),
//                 obscureText: true,
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             TextButton(
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.blue,
//               ),
//               child: Text('YES'),
//               onPressed: () {
//                 // Handle exchange logic here
//                 Navigator.of(context).pop();
//                 showExchangeDialog(context, imagePath, itemName, price,
//                     true); // Assume retry with incorrect set to true
//               },
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.grey,
//               ),
//               child: Text('NO'),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class MyPage extends StatefulWidget {
//   const MyPage({super.key});

//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   int mileage = 10000; // Initial mileage

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Page', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.green,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'Privacy',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       children: const [
//                         Icon(Icons.edit, color: Colors.black),
//                         SizedBox(width: 4),
//                         Text('Edit',
//                             style:
//                                 TextStyle(color: Colors.black, fontSize: 16)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             buildPrivacyTile('Name'),
//             buildPrivacyTile('Phone Number'),
//             buildPrivacyTile('Email'),
//             SizedBox(height: 30),
//             buildSectionTitle('My Mileage'),
//             Card(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               child: ListTile(
//                 leading: Icon(Icons.star, color: Colors.orange),
//                 title: Text('$mileage P'),
//               ),
//             ),
//             SizedBox(height: 20),
//             buildSectionTitle('My Exchange Ticket'),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white),
//                 onPressed: () {
//                   if (mileage >= 7500) {
//                     // Assuming each ticket costs 7500 points
//                     setState(() {
//                       mileage -= 7500; // Deduct 7500 points for a ticket
//                     });
//                   } else {
//                     // Show an error or information dialog if not enough mileage
//                     showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: Text("Not Enough Mileage"),
//                             content: Text(
//                                 "You do not have enough mileage to exchange for a ticket."),
//                             actions: [
//                               TextButton(
//                                   onPressed: () => Navigator.of(context).pop(),
//                                   child: Text("OK")),
//                             ],
//                           );
//                         });
//                   }
//                 },
//                 child: Text('+ Add Mobile Exchange Ticket',
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//               ),
//             ),
//             SizedBox(height: 10),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding: EdgeInsets.only(left: 20),
//                 child: Image.asset('assets/small_snack_icon.png',
//                     height: 100), // Adjust the path if necessary
//               ),
//             ),
//             SizedBox(height: 30),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(left: 10, bottom: 10, right: 300),
//         child: Container(
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: TextButton.icon(
//             icon: Icon(Icons.arrow_back, color: Colors.black54),
//             label: Text('Go Back', style: TextStyle(color: Colors.black54)),
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const HomeScreen()),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Padding buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget buildPrivacyTile(String label) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.green,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Text(label,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold)),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Container(
//               margin: EdgeInsets.only(left: 10),
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(color: Colors.green),
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: Text('*********',
//                   style: TextStyle(color: Colors.black, fontSize: 16)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SnackDetailPage extends StatelessWidget {
//   const SnackDetailPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Page'),
//         backgroundColor: Colors.green,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Image.asset('assets/small_snack_large.png'),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20.0),
//             child: ElevatedButton(
//               onPressed: () => Navigator.pop(context),
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: Colors.green,
//               ),
//               child: Text('Go back'),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: AddMobileExchangeTicketPage(),
    routes: {
      '/home': (context) => HomeScreen(),
      '/addMobileExchangeTicket': (context) => AddMobileExchangeTicketPage(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}

class AddMobileExchangeTicketPage extends StatefulWidget {
  @override
  _AddMobileExchangeTicketPageState createState() =>
      _AddMobileExchangeTicketPageState();
}

class _AddMobileExchangeTicketPageState
    extends State<AddMobileExchangeTicketPage> {
  int incorrectAttempts = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Mobile Exchange Ticket',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: <Widget>[
          buildExchangeItem(
              context, 'assets/snack.png', '7,500P', 'Snack', '1'),
          buildExchangeItem(
              context, 'assets/cookies.png', '5,000P', 'Cookies', '2'),
          buildExchangeItem(
              context, 'assets/chocolate.png', '3,500P', 'Chocolate', '3'),
          buildExchangeItem(context, 'assets/gift.png', '8,000P', 'Gift', '4'),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: TextButton.icon(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          label: Text('Go back', style: TextStyle(color: Colors.black)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget buildExchangeItem(BuildContext context, String imagePath, String price,
      String itemName, String itemId) {
    return GestureDetector(
      onTap: () {
        showExchangeDialog(context, imagePath, itemName, price, itemId, false);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(price,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  void showExchangeDialog(BuildContext context, String imagePath,
      String itemName, String price, String itemId, bool incorrect) {
    final TextEditingController _idController =
        TextEditingController(); // 이메일 입력
    final TextEditingController _passwordController =
        TextEditingController(); // 비밀번호 입력

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.lightBlue[100],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: Colors.blue)),
          title: Column(
            children: <Widget>[
              Image.asset(imagePath, width: 100, height: 100),
              Text('Would you like to exchange for this product?',
                  textAlign: TextAlign.center),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (incorrect)
                Text(
                  "Personal information was entered incorrectly.\nWould you like to re-enter? (${incorrectAttempts + 1}/5)",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              if (incorrectAttempts < 5) ...[
                SizedBox(height: 20),
                TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  obscureText: true,
                ),
              ] else
                Text(
                  "You have exceeded the maximum number of attempts.",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
          actions: <Widget>[
            if (incorrectAttempts < 5)
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: Text('YES'),
                onPressed: () async {
                  String email = _idController.text;
                  String password = _passwordController.text;

                  // 서버로 인증 및 교환 요청 보내기
                  var response = await http.post(
                    Uri.parse('http://192.168.0.185:8090/exchanger/exchange'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, dynamic>{
                      'email': email,
                      'password': password,
                      'exchangerTicketId': int.parse(itemId),
                      'confirm': true, // 서버측에서 요구할 수 있는 필드
                    }),
                  );

                  if (response.statusCode == 200) {
                    var jsonResponse = jsonDecode(response.body);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(jsonResponse['message'])),
                    );
                  } else {
                    setState(() {
                      incorrectAttempts++;
                    });
                    Navigator.of(context).pop();
                    showExchangeDialog(
                        context, imagePath, itemName, price, itemId, true);
                  }
                },
              ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey,
              ),
              child: Text('NO'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
