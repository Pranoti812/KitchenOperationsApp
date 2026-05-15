import 'package:flutter/material.dart';

class ShelfLifePage extends StatefulWidget {
  const ShelfLifePage({super.key});

  @override
  State<ShelfLifePage> createState() => _ShelfLifePageState();
}

class _ShelfLifePageState extends State<ShelfLifePage> {

  String selectedOption = "Shelf Life Items";

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

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const Text(
              "Kitchen Operations",

              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              children: [

                const Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: Colors.black54,
                ),

                const SizedBox(width: 6),

                Text(
                  "22-02-2023",

                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: Row(
                children: [

                  topButton(
                    title: "Live Orders",
                    selected: false,
                  ),

                  const SizedBox(width: 10),

                  Container(
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 12),

                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(

                        value: selectedOption,

                        dropdownColor: Colors.white,

                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),

                        style: const TextStyle(
                          color: Colors.black,
                        ),

                        items: [
                          "Shelf Life Items",
                          "Prepared Items",
                          "Expired Items",
                        ].map((item) {

                          return DropdownMenuItem(
                            value: item,

                            child: Text(item),
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
                          ].map((item) {

                            return Center(
                              child: Text(
                                item,

                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  topButton(
                    title: "Prepared",
                    selected: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Scrollbar(
                thumbVisibility: true,

                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,

                  child: Container(
                    width: 1180,

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),

                    child: Column(
                      children: [

                        /// HEADER
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
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

                              tableHeader("Item ID", 80),

                              tableHeader("Item Name", 120),

                              tableHeader("Item Type", 120),

                              tableHeader("Preservation", 150),

                              tableHeader("Location", 120),

                              tableHeader("Quantity", 100),

                              tableHeader("Shelf Life", 100),

                              tableHeader("Remaining", 100),

                              tableHeader("Action", 250),
                            ],
                          ),
                        ),

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

                                    tableCell(item["itemId"], 80),

                                    tableCell(item["itemName"], 120),

                                    tableCell(item["itemType"], 120),

                                    tableCell(item["method"], 150),

                                    tableCell(item["location"], 120),

                                    tableCell(item["quantity"], 100),

                                    SizedBox(
                                      width: 100,

                                      child: Text(
                                        item["days"],

                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),

                                    tableCell(item["remaining"], 100),

                                    SizedBox(
                                      width: 250,

                                      child: Row(
                                        children: [
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
                                                "Discount",

                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),

                                          const SizedBox(width: 8),

                                          Expanded(
                                            flex: 2,

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

                                              child: const Padding(
                                                padding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 4,
                                                ),

                                                child: Text(
                                                  "Remove Wishlist",

                                                  maxLines: 1,

                                                  overflow:
                                                  TextOverflow.ellipsis,

                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 9,
                                                  ),
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
              ),
            ),
          ],
        ),
      ),

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
              Icons.grid_view_rounded,
              "Dashboard",
              false,
            ),

            bottomItem(
              Icons.delivery_dining_outlined,
              "Take Orders",
              false,
            ),

            bottomItem(
              Icons.restaurant_menu_outlined,
              "Prepare Order",
              false,
            ),

            bottomItem(
              Icons.soup_kitchen_outlined,
              "Kitchen Operation",
              true,
            ),
          ],
        ),
      ),
    );
  }

  Widget topButton({
    required String title,
    required bool selected,
  }) {

    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 18),

      alignment: Alignment.center,

      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.white,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Text(
        title,

        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget tableHeader(String title, double width) {

    return SizedBox(
      width: width,

      child: Text(
        title,

        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget tableCell(String value, double width) {

    return SizedBox(
      width: width,

      child: Text(
        value,

        overflow: TextOverflow.ellipsis,

        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  Widget bottomItem(
      IconData icon,
      String title,
      bool selected,
      ) {

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