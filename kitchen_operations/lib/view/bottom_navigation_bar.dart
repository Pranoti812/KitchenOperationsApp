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
            icon: Icon(Icons.dashboard_outlined),
            label: "Dashboard",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Take Orders",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Prepare Order",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home_work_outlined),
            label: "Kitchen Operation",
          ),
        ],
    );
  }
}