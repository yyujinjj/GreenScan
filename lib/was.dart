import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waste Disposal Application',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CategorySelectionScreen(),
    );
  }
}

class CategorySelectionScreen extends StatelessWidget {
  final List<Category> categories = [
    // Define your categories with additional disposalItems if necessary
    Category(
        name: 'Furniture',
        icon: Icons.chair,
        disposalMethod:
            'Disassemble if possible and dispose of as bulky waste.',
        disposalItems: [
          DisposalItem(
              name: 'Sofa', distinction: 'Over 2 meters', fee: '15,000'),
          DisposalItem(name: 'Chair', distinction: 'Wooden', fee: '3,000'),
        ]),
    Category(
      name: 'Home Appliances',
      icon: Icons.kitchen,
      disposalMethod: 'Recycle at local e-waste facilities.',
      disposalItems: [
        DisposalItem(
            name: 'Refrigerator', distinction: 'Over 500L', fee: '20,000'),
        DisposalItem(name: 'Microwave', distinction: 'Standard', fee: '5,000'),
      ],
    ),
    Category(
      name: 'Heating',
      icon: Icons.ac_unit,
      disposalMethod: 'Contact a certified HVAC disposal service.',
      disposalItems: [
        DisposalItem(
            name: 'Gas Heater', distinction: 'Above 10 kW', fee: '10,000'),
      ],
    ),
    Category(
      name: 'Kitchen',
      icon: Icons.restaurant,
      disposalMethod: 'Compost organic waste and recycle containers.',
      disposalItems: [
        DisposalItem(
            name: 'Gas Oven Range',
            distinction: 'Height over 1m',
            fee: '4,000'),
        DisposalItem(
            name: 'Gas Oven Range',
            distinction: 'Less than 1m in height',
            fee: '2,000'),
      ],
    ),
    Category(
      name: 'Health/Medical',
      icon: Icons.local_hospital,
      disposalMethod: 'Follow local regulations for medical waste.',
      disposalItems: [
        DisposalItem(
            name: 'X-ray Machine', distinction: 'Clinical use', fee: '30,000'),
        DisposalItem(
            name: 'Dental Chair',
            distinction: 'With hydraulics',
            fee: '15,000'),
      ],
    ),
    Category(
      name: 'Living/Kitchen',
      icon: Icons.living,
      disposalMethod:
          'Dispose of household items via recycling or waste management centers.',
      disposalItems: [
        DisposalItem(
            name: 'Dining Table', distinction: 'Wooden', fee: '10,000'),
        DisposalItem(name: 'Cabinet', distinction: 'Metal', fee: '8,000'),
      ],
    ),
    Category(
      name: 'Sports/Leisure',
      icon: Icons.sports_soccer,
      disposalMethod: 'Donate usable items and recycle broken parts.',
      disposalItems: [
        DisposalItem(name: 'Treadmill', distinction: 'Electric', fee: '20,000'),
        DisposalItem(name: 'Bicycle', distinction: 'Adult-sized', fee: '5,000'),
      ],
    ),
    Category(
      name: 'Instrument/Tools',
      icon: Icons.build,
      disposalMethod:
          'Recycle metal components and dispose of other parts safely.',
      disposalItems: [
        DisposalItem(
            name: 'Power Drill', distinction: 'Cordless', fee: '4,000'),
        DisposalItem(name: 'Saw', distinction: 'Hand-operated', fee: '2,000'),
      ],
    ),
    Category(
      name: 'Automotive/Tools',
      icon: Icons.directions_car,
      disposalMethod: 'Take to automotive recycling centers.',
      disposalItems: [
        DisposalItem(
            name: 'Car Tire', distinction: 'Rubber', fee: '1,000 per tire'),
        DisposalItem(name: 'Engine Parts', distinction: 'Metal', fee: '3,000'),
      ],
    ),
    Category(
      name: 'Hobbies/Stationery',
      icon: Icons.brush,
      disposalMethod:
          'Recycle paper products and properly dispose of crafts supplies.',
      disposalItems: [
        DisposalItem(name: 'Paint Set', distinction: 'Oil-based', fee: '2,000'),
        DisposalItem(name: 'Sketchbook', distinction: 'A3 size', fee: '500'),
      ],
    ),
    // Add other categories following the same structure
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please Select an Item'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(categories[index].icon),
            title: Text(categories[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryDetailScreen(category: categories[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final Category category;

  CategoryDetailScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disposal: ${category.name}'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: category.disposalItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(category.disposalItems[index].name),
                  subtitle: Text(
                      '${category.disposalItems[index].distinction} - ${category.disposalItems[index].fee} Won'),
                );
              },
            ),
          ),
          Text(
            category.disposalMethod,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          ElevatedButton.icon(
            onPressed: () => _launchURL(),
            icon: Icon(Icons.launch, color: Colors.white),
            label: Text('Apply for discharge',
                style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL() async {
    const url =
        'https://www.yongin.go.kr/user/web/lgzWste/wsteExhstReq/BD_insertWsteExhstReqForm.do';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Category {
  final String name;
  final IconData icon;
  final String disposalMethod;
  final List<DisposalItem> disposalItems;

  Category(
      {required this.name,
      required this.icon,
      required this.disposalMethod,
      this.disposalItems = const []});
}

class DisposalItem {
  final String name;
  final String distinction;
  final String fee;

  DisposalItem(
      {required this.name, required this.distinction, required this.fee});
}
