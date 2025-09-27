import 'package:flutter/material.dart';

import 'item.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {

  List<Item> items = [
    Item(
        id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'
    ),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'), Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),
    Item(id: 1,
        name: 'Item 1',
        price: 10.99,
        imagePath: 'assets/images/item1.jpg'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Text(items[index].price.toString()),
            leading: Image.asset(items[index].imagePath),
          );
        },
      ),
    );
  }
}
