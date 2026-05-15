import 'package:flutter/material.dart';

class KitchenOperationScreen extends StatefulWidget {
  const KitchenOperationScreen({super.key});

  @override
  State<KitchenOperationScreen> createState() =>
      _KitchenOperationScreenState();
}

class _KitchenOperationScreenState
    extends State<KitchenOperationScreen> {

  int selectedTopTab = 1;

  final List<String> topTabs = [
    "Schedule",
    "Live Orders",
    "Shelf Life Items",
    "Prepared",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF7F7F7),

      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          "Kitchen Operations",

          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),

        actions: [

          Container(

            margin: const EdgeInsets.only(right: 16),

            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 7,
            ),

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20),

              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),

            child: Row(
              children: [

                const Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: Colors.grey,
                ),

                const SizedBox(width: 5),

                Text(
                  "22-02-2023",

                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: 3,

        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,

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
      ),

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const SizedBox(height: 10),

            /// ================= TOP TABS =================

            SizedBox(
              height: 38,

              child: ListView.builder(

                scrollDirection: Axis.horizontal,

                padding: const EdgeInsets.symmetric(horizontal: 14),

                itemCount: topTabs.length,

                itemBuilder: (context, index) {

                  bool isSelected = selectedTopTab == index;

                  return GestureDetector(

                    onTap: () {

                      setState(() {
                        selectedTopTab = index;
                      });
                    },

                    child: Container(

                      margin: const EdgeInsets.only(right: 10),

                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),

                      alignment: Alignment.center,

                      decoration: BoxDecoration(

                        color: isSelected
                            ? const Color(0xff1B1533)
                            : Colors.white,

                        borderRadius: BorderRadius.circular(22),

                        border: Border.all(
                          color: isSelected
                              ? const Color(0xff1B1533)
                              : Colors.grey.shade300,
                        ),
                      ),

                      child: Text(

                        topTabs[index],

                        style: TextStyle(

                          fontSize: 11,

                          fontWeight: FontWeight.w500,

                          color: isSelected
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 22),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 14),

              child: Row(
                children: [

                  Column(
                    children: [

                      const Text(
                        "Runing Orders",

                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Container(
                        height: 2,
                        width: 90,
                        color: Colors.black,
                      ),
                    ],
                  ),

                  const SizedBox(width: 35),

                  Text(
                    "Ala Carte Menu",

                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 14),

              child: Column(
                children: [

                  simpleOrderCard(),

                  detailedOrderCard(),

                  simpleOrderCard(),

                  simpleOrderCard(),
                ],
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),

              child: Text(
                "Breakfast Menu & Quantity",

                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 14),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 14),

              child: Row(
                children: [

                  smallTab("Prepare", false),

                  const SizedBox(width: 10),

                  smallTab("Available", true),

                  const SizedBox(width: 10),

                  smallTab("Required", false),
                ],
              ),
            ),

            const SizedBox(height: 14),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 14),

              child: availableTable(),
            ),

            const SizedBox(height: 30),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),

              child: Text(
                "Breakfast Menu & Quantity",

                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 14),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 14),

              child: Row(
                children: [

                  smallTab("Prepare", false),

                  const SizedBox(width: 10),

                  smallTab("Available", false),

                  const SizedBox(width: 10),

                  smallTab("Required", true),
                ],
              ),
            ),

            const SizedBox(height: 14),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 14),

              child: requiredTable(),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget simpleOrderCard() {

    return Container(

      margin: const EdgeInsets.only(bottom: 28),

      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: const Color(0xffD9DDE3),
        ),
      ),

      child: Stack(
        clipBehavior: Clip.none,

        children: [

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

            children: [

              cardText("Order Id", "10098"),

              verticalDivider(),

              cardText("Room", "A-101"),

              verticalDivider(),

              cardText("Order Status", "Preparing"),

              verticalDivider(),

              cardText("Timer", "29:38"),
            ],
          ),

          Positioned(
            bottom: -28,
            right: -4,

            child: downArrow(),
          ),
        ],
      ),
    );
  }

  Widget detailedOrderCard() {

    return Container(

      margin: const EdgeInsets.only(bottom: 28),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: const Color(0xffD9DDE3),
        ),
      ),

      child: Stack(
        clipBehavior: Clip.none,

        children: [

          Column(
            children: [

              Padding(

                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 16,
                ),

                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    cardText("Order Id", "10098"),

                    verticalDivider(),

                    cardText("Room", "A-101"),

                    verticalDivider(),

                    cardText("Order Status", "Preparing"),

                    verticalDivider(),

                    cardText("Timer", "29:38"),
                  ],
                ),
              ),

              Divider(color: Colors.grey.shade300),

              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 14),

                child: Row(
                  children: [

                    tableHeader("Item Name"),

                    tableHeader("Quantity"),

                    tableHeader("Assigned"),

                    tableHeader("Status"),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              detailedItem(false),

              Divider(color: Colors.grey.shade300),

              detailedItem(false),

              Divider(color: Colors.grey.shade300),

              detailedItem(true),

              const SizedBox(height: 18),

              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 14),

                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    OutlinedButton(
                      onPressed: () {},

                      child: const Text(
                        "Cancel Order",

                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),

                    OutlinedButton(

                      onPressed: () {},

                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                      ),

                      child: const Text(
                        "Cancel All",

                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),

          Positioned(
            bottom: -12,
            right: 10,

            child: upArrow(),
          ),
        ],
      ),
    );
  }

  Widget detailedItem(bool assign) {

    return Padding(

      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),

      child: Row(
        children: [

          const Expanded(
            child: Text(
              "Butter\nChicken",

              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const Expanded(
            child: Text(
              "2 × 500g",

              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Expanded(

            child: assign

                ? Text(
              "Assign",

              style: TextStyle(
                color: Colors.green.shade700,
                decoration: TextDecoration.underline,
                fontSize: 13,
              ),
            )

                : const Text(
              "Rahul K.",

              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(

            child: assign

                ? const Text(
              "Prepared",

              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )

                : Align(
              alignment: Alignment.centerLeft,

              child: Container(

                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(4),
                ),

                child: const Text(

                  "Cancel",

                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget availableTable() {

    return Container(

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: const Color(0xffD9DDE3),
        ),
      ),

      child: Column(
        children: [

          Row(
            children: [

              tableHeader("Item Name"),

              tableHeader("Available\nQuantity"),

              tableHeader("Updated by"),
            ],
          ),

          const SizedBox(height: 18),

          availableRow(),

          const SizedBox(height: 12),

          availableRow(),

          const SizedBox(height: 18),

          Align(
            alignment: Alignment.centerLeft,

            child: OutlinedButton(

              onPressed: () {},

              child: const Text(
                "Edit",

                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget availableRow() {

    return Row(
      children: [

        const Expanded(
          child: Text(
            "Beef Steak\nPaneer Tikka",
          ),
        ),

        const Expanded(
          child: Text(
            "100kg\n---",
          ),
        ),

        const Expanded(
          child: Text(
            "Rahul K.\nSalman",
          ),
        ),
      ],
    );
  }

  Widget requiredTable() {

    return Container(

      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: const Color(0xffD9DDE3),
        ),
      ),

      child: Column(
        children: [

          Row(
            children: [

              tableHeader("Item Name"),

              tableHeader("Required\nQuantity"),

              tableHeader("Updated by"),
            ],
          ),

          const SizedBox(height: 18),

          requiredRow(),

          const SizedBox(height: 14),

          requiredRow(),

          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerRight,

            child: ElevatedButton(

              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1B1533),
              ),

              child: const Text(
                "Save",

                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget requiredRow() {

    return Row(
      children: [

        const Expanded(
          child: Text(
            "Beef Steak\nPaneer Tikka",
          ),
        ),

        Expanded(
          child: Column(
            children: [

              quantityBox("50", "kg"),

              const SizedBox(height: 8),

              quantityBox("50", "Pieces"),
            ],
          ),
        ),

        const Expanded(
          child: Text(
            "Rahul K.\nSalman",
          ),
        ),
      ],
    );
  }

  Widget quantityBox(String value, String unit) {

    return Container(

      height: 28,

      padding: const EdgeInsets.symmetric(horizontal: 8),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(4),
      ),

      child: Row(
        children: [

          Expanded(
            child: Text(value),
          ),

          Text(
            unit,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
  
  Widget cardText(String title, String value) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(

          title,

          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 12,
          ),
        ),

        const SizedBox(height: 6),

        Text(

          value,

          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget tableHeader(String title) {

    return Expanded(

      child: Text(

        title,

        style: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 11,
        ),
      ),
    );
  }

  Widget verticalDivider() {

    return Container(
      height: 38,
      width: 1,
      color: const Color(0xffE5E7EB),
    );
  }

  Widget downArrow() {

    return Container(

      height: 24,
      width: 24,

      decoration: BoxDecoration(

        color: Colors.white,

        shape: BoxShape.circle,

        border: Border.all(
          color: const Color(0xffD9DDE3),
        ),
      ),

      child: const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 18,
        color: Colors.grey,
      ),
    );
  }

  Widget upArrow() {

    return Container(

      height: 24,
      width: 24,

      decoration: BoxDecoration(

        color: Colors.white,

        shape: BoxShape.circle,

        border: Border.all(
          color: const Color(0xffD9DDE3),
        ),
      ),

      child: const Icon(
        Icons.keyboard_arrow_up_rounded,
        size: 18,
        color: Colors.grey,
      ),
    );
  }

  static Widget smallTab(String title, bool selected) {

    return Container(

      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),

      decoration: BoxDecoration(

        color: selected
            ? const Color(0xff1B1533)
            : Colors.grey.shade200,

        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(

        title,

        style: TextStyle(
          fontSize: 11,

          color: selected
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }
}