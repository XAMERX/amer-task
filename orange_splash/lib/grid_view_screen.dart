import 'package:flutter/material.dart';

import 'item.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => GridViewScreenState();
}

class GridViewScreenState extends State<GridViewScreen> {
  List<Item> items = [
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
    Item(
      id: 1,
      name: 'Item 1',
      price: 10.99,
      imagePath: 'assets/images/item1.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            color: Colors.blue,
            child: Column(
              children: [
                Image.asset(items[index].imagePath),
                Text(items[index].name),
                Text(items[index].price.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}
