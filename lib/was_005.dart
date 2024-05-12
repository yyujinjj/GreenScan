import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waste Category Selection',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CategorySelectionScreen(),
    );
  }
}

class CategorySelectionScreen extends StatelessWidget {
  final List<Category> categories = [
    Category(
        name: 'Furniture',
        icon: Icons.chair,
        disposalMethod:
            'Disassemble if possible and dispose of as bulky waste.'),
    Category(
        name: 'Home Appliances',
        icon: Icons.kitchen,
        disposalMethod: 'Recycle at local e-waste facilities.'),
    Category(
        name: 'Heating',
        icon: Icons.ac_unit,
        disposalMethod: 'Contact a certified HVAC disposal service.'),
    Category(
        name: 'Kitchen',
        icon: Icons.restaurant,
        disposalMethod: 'Compost organic waste and recycle containers.'),
    Category(
        name: 'Health/Medical',
        icon: Icons.local_hospital,
        disposalMethod: 'Follow local regulations for medical waste.'),
    Category(
        name: 'Living/Kitchen',
        icon: Icons.living,
        disposalMethod:
            'Dispose of household items via recycling or waste management centers.'),
    Category(
        name: 'Sports/Leisure',
        icon: Icons.sports_soccer,
        disposalMethod: 'Donate usable items and recycle broken parts.'),
    Category(
        name: 'Instrument/Tools',
        icon: Icons.build,
        disposalMethod:
            'Recycle metal components and dispose of other parts safely.'),
    Category(
        name: 'Automotive/Tools',
        icon: Icons.directions_car,
        disposalMethod: 'Take to automotive recycling centers.'),
    Category(
        name: 'Hobbies/Stationery',
        icon: Icons.brush,
        disposalMethod:
            'Recycle paper products and properly dispose of crafts supplies.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please Select an Item'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
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
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.arrow_back, color: Colors.black),
                    Text(' Go back', style: TextStyle(color: Colors.black)),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final Category category;

  const CategoryDetailScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(category.icon, size: 100),
            SizedBox(height: 20),
            Text(
              category.disposalMethod,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;
  final String disposalMethod;

  Category(
      {required this.name, required this.icon, required this.disposalMethod});
}
