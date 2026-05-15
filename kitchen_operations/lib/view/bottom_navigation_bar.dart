import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  final int index;

  const CustomBottomNavigationBar({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: index,

      type: BottomNavigationBarType.fixed,

      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.takeout_dining),
          label: 'Take Orders',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: 'Prepare Order',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Kitchen Operation',
        ),
      ],
    );
  }
}