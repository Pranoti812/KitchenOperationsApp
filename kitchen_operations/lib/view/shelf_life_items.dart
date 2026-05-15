import 'package:flutter/material.dart';

class ShelfLifePage extends StatefulWidget {
  const ShelfLifePage({super.key});

  @override
  State<ShelfLifePage> createState() => _ShelfLifePageState();
}

class _ShelfLifePageState extends State<ShelfLifePage> {

  /// SELECTED DROPDOWN VALUE
  String selectedOption = "Shelf Life Items";

  /// DUMMY DATA
  final List<Map<String, dynamic>> shelfLifeList = [
    {
      "itemId": "IN01",
      "itemName": "Tomato",
      "itemType": "Vegetables",
      "method": "Refrigerator",
      "location": "Location1",
      "quantity": "8 kg",
      "days": "2 Days",
      "remaining": "2 kg",
    },
    {
      "itemId": "IN01",
      "itemName": "Cheese",
      "itemType": "Dairy",
      "method": "Deep Freeze",
      "location": "Location2",
      "quantity": "5 kg",
      "days": "3 Days",
      "remaining": "3 kg",
    },
    {
      "itemId": "IN01",
      "itemName": "Rice",
      "itemType": "Grocery",
      "method": "Dry",
      "location": "Location1",
      "quantity": "20 kg",
      "days": "5 Days",
      "remaining": "5 kg",
    },
    {
      "itemId": "IN01",
      "itemName": "Tomato",
      "itemType": "Vegetables",
      "method": "Refrigerator",
      "location": "Location2",
      "quantity": "8 kg",
      "days": "2 Days",
      "remaining": "7 kg",
    },
    {
      "itemId": "IN01",
      "itemName": "Tomato",
      "itemType": "Vegetables",
      "method": "Refrigerator",
      "location": "Location1",
      "quantity": "8 kg",
      "days": "2 Days",
      "remaining": "4 kg",
    },
    {
      "itemId": "IN01",
      "itemName": "Tomato",
      "itemType": "Vegetables",
      "method": "Refrigerator",
      "location": "Location2",
      "quantity": "8 kg",
      "days": "2 Days",
      "remaining": "7 kg",
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      /// APP BAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,

        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// TITLE
              const Text(
                "Kitchen Operations",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),

              /// DATE
              Row(
                children: [

                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                    color: Colors.black54,
                  ),

                  const SizedBox(width: 8),

                  Text(
                    "22-02-2023",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      /// BODY
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// TOP BUTTONS
            Row(
              children: [

                /// LIVE ORDERS BUTTON
                buildTopButton(
                  title: "Live Orders",
                  isSelected: false,
                ),

                const SizedBox(width: 12),

                /// DROPDOWN BUTTON
                Container(
                  height: 42,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(

                      value: selectedOption,

                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),

                      dropdownColor: Colors.white,

                      borderRadius: BorderRadius.circular(12),

                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),

                      items: [
                        "Shelf Life Items",
                        "Prepared Items",
                        "Expired Items",
                        "Inventory Items",
                      ].map((item) {

                        return DropdownMenuItem(
                          value: item,

                          child: Text(
                            item,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),

                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },

                      selectedItemBuilder: (context) {

                        return [
                          "Shelf Life Items",
                          "Prepared Items",
                          "Expired Items",
                          "Inventory Items",
                        ].map((item) {

                          return Row(
                            children: [

                              Text(
                                item,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                /// PREPARED BUTTON
                buildTopButton(
                  title: "Prepared",
                  isSelected: false,
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// TABLE CONTAINER
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),

                child: Column(
                  children: [

                    /// TABLE HEADER
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),

                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ),

                      child: Row(
                        children: [

                          tableHeader("Item ID", 1),

                          tableHeader("Item Name", 1.3),

                          tableHeader("Item Type", 1.3),

                          tableHeader("Preservation Method", 2),

                          tableHeader("Storage Location", 1.5),

                          tableHeader("Total Available\nQuantity", 1.6),

                          tableHeader("Days Left\nTo Shelf Life", 1.6),

                          tableHeader("Remaining", 1),

                          tableHeader("Action", 2.5),
                        ],
                      ),
                    ),

                    /// TABLE DATA
                    Expanded(
                      child: ListView.builder(
                        itemCount: shelfLifeList.length,

                        itemBuilder: (context, index) {

                          final item = shelfLifeList[index];

                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),

                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.shade200,
                                ),
                              ),
                            ),

                            child: Row(
                              children: [

                                tableCell(item["itemId"], 1),

                                tableCell(item["itemName"], 1.3),

                                tableCell(item["itemType"], 1.3),

                                tableCell(item["method"], 2),

                                tableCell(item["location"], 1.5),

                                tableCell(item["quantity"], 1.6),

                                /// RED DAYS TEXT
                                Expanded(
                                  flex: 16,
                                  child: Text(
                                    item["days"],
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),

                                tableCell(item["remaining"], 1),

                                /// ACTION BUTTONS
                                Expanded(
                                  flex: 25,
                                  child: Row(
                                    children: [

                                      /// SET DISCOUNT BUTTON
                                      Expanded(
                                        child: Container(
                                          height: 32,
                                          alignment: Alignment.center,

                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                            BorderRadius.circular(6),
                                          ),

                                          child: const Text(
                                            "Set Discount Offer",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 8),

                                      /// REMOVE BUTTON
                                      Expanded(
                                        child: Container(
                                          height: 32,
                                          alignment: Alignment.center,

                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                            ),

                                            borderRadius:
                                            BorderRadius.circular(6),
                                          ),

                                          child: const Text(
                                            "Remove From Wishlist",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      /// BOTTOM NAVIGATION
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
            ),
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            bottomItem(
              icon: Icons.grid_view_rounded,
              title: "Dashboard",
              selected: false,
            ),

            bottomItem(
              icon: Icons.delivery_dining_outlined,
              title: "Take Orders",
              selected: false,
            ),

            bottomItem(
              icon: Icons.restaurant_menu_outlined,
              title: "Prepare Order",
              selected: false,
            ),

            bottomItem(
              icon: Icons.soup_kitchen_outlined,
              title: "Kitchen Operation",
              selected: true,
            ),
          ],
        ),
      ),
    );
  }

  /// TOP BUTTON
  Widget buildTopButton({
    required String title,
    required bool isSelected,
  }) {

    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 18),

      alignment: Alignment.center,

      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Text(
        title,

        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// TABLE HEADER
  Widget tableHeader(String title, double flexValue) {

    return Expanded(
      flex: (flexValue * 10).toInt(),

      child: Text(
        title,

        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  /// TABLE CELL
  Widget tableCell(String value, double flexValue) {

    return Expanded(
      flex: (flexValue * 10).toInt(),

      child: Text(
        value,

        style: const TextStyle(
          fontSize: 12,
          color: Colors.black87,
        ),
      ),
    );
  }

  /// BOTTOM NAVIGATION ITEM
  Widget bottomItem({
    required IconData icon,
    required String title,
    required bool selected,
  }) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(
          icon,
          size: 22,
          color: selected ? Colors.black : Colors.grey,
        ),

        const SizedBox(height: 4),

        Text(
          title,

          style: TextStyle(
            fontSize: 11,
            color: selected ? Colors.black : Colors.grey,
            fontWeight:
            selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}