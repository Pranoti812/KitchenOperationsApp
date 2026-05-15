import 'package:flutter/material.dart';
import 'package:kitchen_operations/view/live_orders_screen.dart';
import 'package:kitchen_operations/view/schedule_screen.dart';
import 'package:kitchen_operations/view/shelf_life_items.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShelfLifePage(),
    );
  }
}
