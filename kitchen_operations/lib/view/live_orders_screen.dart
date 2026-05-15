// import 'package:flutter/material.dart';

// class LiveOrdersScreen extends StatefulWidget {
//   const LiveOrdersScreen({super.key});

//   @override
//   State<LiveOrdersScreen> createState() => _LiveOrdersScreenState();
// }

// class _LiveOrdersScreenState extends State<LiveOrdersScreen> {

//   int selectedTopTab = 1;
//   int selectedMenuTab = 0;

//   List<String> topTabs = [
//     "Schedule",
//     "Live Orders",
//     "Shelf Life Items",
//     "Prepared"
//   ];

//   List<String> menuTabs = [
//     "Running Orders",
//     "Ala Carte Menu"
//   ];

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       backgroundColor: Colors.white,

//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,

//         title: const Text(
//           "Kitchen Operations",

//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),

//         actions: [

//           Row(
//             children: [

//               const Icon(
//                 Icons.calendar_today,
//                 size: 16,
//                 color: Colors.grey,
//               ),

//               const SizedBox(width: 4),

//               Text(
//                 "22-02-2023",

//                 style: TextStyle(
//                   color: Colors.grey.shade700,
//                   fontSize: 12,
//                 ),
//               ),

//               const SizedBox(width: 15),
//             ],
//           ),
//         ],
//       ),

//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 3,

//         type: BottomNavigationBarType.fixed,

//         items: const [

//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard),
//             label: "Dashboard",
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_outlined),
//             label: "Take Orders",
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: "Prepare Order",
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_work_outlined),
//             label: "Kitchen Operation",
//           ),
//         ],
//       ),

//       body: Column(
//         children: [

//           const SizedBox(height: 10),

//           /// TOP TABS
//           SizedBox(
//             height: 40,

//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,

//               padding: const EdgeInsets.symmetric(horizontal: 10),

//               itemCount: topTabs.length,

//               itemBuilder: (context, index) {

//                 return GestureDetector(

//                   onTap: () {
//                     setState(() {
//                       selectedTopTab = index;
//                     });
//                   },

//                   child: Container(
//                     margin: const EdgeInsets.only(right: 8),

//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 14,
//                     ),

//                     alignment: Alignment.center,

//                     decoration: BoxDecoration(
//                       color: selectedTopTab == index
//                           ? const Color(0xff1B1533)
//                           : Colors.white,

//                       borderRadius: BorderRadius.circular(20),

//                       border: Border.all(
//                         color: Colors.grey.shade300,
//                       ),
//                     ),

//                     child: Text(
//                       topTabs[index],

//                       style: TextStyle(
//                         fontSize: 11,

//                         color: selectedTopTab == index
//                             ? Colors.white
//                             : Colors.black,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           const SizedBox(height: 15),

//           /// MENU TABS
//           Row(
//             children: List.generate(menuTabs.length, (index) {

//               return GestureDetector(

//                 onTap: () {
//                   setState(() {
//                     selectedMenuTab = index;
//                   });
//                 },

//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 2,
//                   padding: const EdgeInsets.only(bottom: 10),

//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(
//                         color: selectedMenuTab == index
//                             ? Colors.black
//                             : Colors.grey.shade300,

//                         width: selectedMenuTab == index
//                             ? 2
//                             : 1,
//                       ),
//                     ),
//                   ),

//                   child: Center(
//                     child: Text(
//                       menuTabs[index],

//                       style: TextStyle(
//                         fontSize: 13,

//                         color: selectedMenuTab == index
//                             ? Colors.black
//                             : Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ),

//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(12),

//               child: Column(
//                 children: [

//                   /// ORDER CARDS
//                   ListView.builder(
//                     shrinkWrap: true,

//                     physics: const NeverScrollableScrollPhysics(),

//                     itemCount: 4,

//                     itemBuilder: (context, index) {

//                       return orderCard();
//                     },
//                   ),

//                   const SizedBox(height: 25),

//                   /// BREAKFAST SECTION
//                   breakfastSection(),

//                   const SizedBox(height: 25),

//                   /// REQUIRED SECTION
//                   requiredSection(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget orderCard() {

//     return Container(
//       margin: const EdgeInsets.only(bottom: 15),

//       padding: const EdgeInsets.all(12),

//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.grey.shade300,
//         ),

//         borderRadius: BorderRadius.circular(6),
//       ),

//       child: Column(
//         children: [

//           /// TOP DETAILS
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [

//               topText("OrderId", "10098"),
//               topText("Room", "A-101"),
//               topText("Order Status", "Preparing"),
//               topText("Timer", "29:38"),
//             ],
//           ),

//           const SizedBox(height: 14),

//           Divider(color: Colors.grey.shade300),

//           const SizedBox(height: 10),

//           /// TABLE HEADERS
//           Row(
//             children: [

//               tableHeader("Item Name"),
//               tableHeader("Quantity"),
//               tableHeader("Assigned"),
//               tableHeader("Status"),
//             ],
//           ),

//           const SizedBox(height: 10),

//           /// ITEMS
//           orderItem(),

//           const SizedBox(height: 10),

//           orderItem(),

//           const SizedBox(height: 10),

//           Row(
//             children: [

//               Expanded(
//                 child: Row(
//                   children: [

//                     const Expanded(
//                       child: Text(
//                         "Butter\nChicken",
//                         style: TextStyle(fontSize: 13),
//                       ),
//                     ),

//                     const Expanded(
//                       child: Text(
//                         "2 × 500g",

//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ),

//                     Expanded(
//                       child: Text(
//                         "Assign",

//                         style: TextStyle(
//                           color: Colors.green.shade700,
//                           fontSize: 13,
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),

//                     const Expanded(
//                       child: Text(
//                         "Prepared",
//                         style: TextStyle(fontSize: 13),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 14),

//           /// BUTTONS
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [

//               OutlinedButton(
//                 onPressed: () {},

//                 child: const Text(
//                   "Cancel Order",

//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 11,
//                   ),
//                 ),
//               ),

//               OutlinedButton(
//                 onPressed: () {},

//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Colors.red),
//                 ),

//                 child: const Text(
//                   "Cancel All",

//                   style: TextStyle(
//                     color: Colors.red,
//                     fontSize: 11,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget topText(String title, String value) {

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [

//         Text(
//           title,

//           style: TextStyle(
//             color: Colors.grey.shade500,
//             fontSize: 10,
//           ),
//         ),

//         const SizedBox(height: 4),

//         Text(
//           value,

//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 12,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget tableHeader(String title) {

//     return Expanded(
//       child: Text(
//         title,

//         style: TextStyle(
//           color: Colors.grey.shade500,
//           fontSize: 10,
//         ),
//       ),
//     );
//   }

//   Widget orderItem() {

//     return Row(
//       children: [

//         const Expanded(
//           child: Text(
//             "Butter\nChicken",
//             style: TextStyle(fontSize: 13),
//           ),
//         ),

//         const Expanded(
//           child: Text(
//             "2 × 500g",

//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 13,
//             ),
//           ),
//         ),

//         const Expanded(
//           child: Text(
//             "Rahul K.",
//             style: TextStyle(fontSize: 13),
//           ),
//         ),

//         Expanded(
//           child: Align(
//             alignment: Alignment.centerLeft,

//             child: OutlinedButton(
//               onPressed: () {},

//               style: OutlinedButton.styleFrom(
//                 minimumSize: const Size(60, 28),
//                 side: const BorderSide(color: Colors.red),
//               ),

//               child: const Text(
//                 "Cancel",

//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 10,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget breakfastSection() {

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [

//         const Text(
//           "Breakfast Menu & Quantity",

//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 14,
//           ),
//         ),

//         const SizedBox(height: 14),

//         Row(
//           children: [

//             smallTab("Prepare", false),
//             const SizedBox(width: 10),
//             smallTab("Available", true),
//             const SizedBox(width: 10),
//             smallTab("Required", false),
//           ],
//         ),

//         const SizedBox(height: 14),

//         Container(
//           padding: const EdgeInsets.all(12),

//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.grey.shade300,
//             ),

//             borderRadius: BorderRadius.circular(6),
//           ),

//           child: Column(
//             children: [

//               Row(
//                 children: [

//                   tableHeader("Item Name"),
//                   tableHeader("Available\nQuantity"),
//                   tableHeader("Updated by"),
//                 ],
//               ),

//               const SizedBox(height: 15),

//               breakfastRow(),

//               const SizedBox(height: 10),

//               breakfastRow(),

//               const SizedBox(height: 15),

//               Align(
//                 alignment: Alignment.centerLeft,

//                 child: OutlinedButton(
//                   onPressed: () {},

//                   child: const Text(
//                     "Edit",

//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget breakfastRow() {

//     return Row(
//       children: [

//         const Expanded(
//           child: Text(
//             "Beef Steak\nPaneer Tikka",
//             style: TextStyle(fontSize: 13),
//           ),
//         ),

//         const Expanded(
//           child: Text(
//             "100kg\n--",
//             style: TextStyle(fontSize: 13),
//           ),
//         ),

//         const Expanded(
//           child: Text(
//             "Rahul K.\nSalman",
//             style: TextStyle(fontSize: 13),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget requiredSection() {

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [

//         const Text(
//           "Breakfast Menu & Quantity",

//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 14,
//           ),
//         ),

//         const SizedBox(height: 14),

//         Row(
//           children: [

//             smallTab("Prepare", false),
//             const SizedBox(width: 10),
//             smallTab("Available", false),
//             const SizedBox(width: 10),
//             smallTab("Required", true),
//           ],
//         ),

//         const SizedBox(height: 14),

//         Container(
//           padding: const EdgeInsets.all(12),

//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.grey.shade300,
//             ),

//             borderRadius: BorderRadius.circular(6),
//           ),

//           child: Column(
//             children: [

//               Row(
//                 children: [

//                   tableHeader("Item Name"),
//                   tableHeader("Required\nQuantity"),
//                   tableHeader("Updated by"),
//                 ],
//               ),

//               const SizedBox(height: 15),

//               requiredRow(),

//               const SizedBox(height: 10),

//               requiredRow(),

//               const SizedBox(height: 15),

//               Align(
//                 alignment: Alignment.centerRight,

//                 child: ElevatedButton(
//                   onPressed: () {},

//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xff1B1533),
//                   ),

//                   child: const Text(
//                     "Save",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget requiredRow() {

//     return Row(
//       children: [

//         const Expanded(
//           child: Text(
//             "Beef Steak\nPaneer Tikka",
//             style: TextStyle(fontSize: 13),
//           ),
//         ),

//         Expanded(
//           child: Column(
//             children: [

//               quantityBox(),
//               const SizedBox(height: 8),
//               quantityBox(),
//             ],
//           ),
//         ),

//         const Expanded(
//           child: Text(
//             "Rahul K.\nSalman",
//             style: TextStyle(fontSize: 13),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget quantityBox() {

//     return Container(
//       height: 26,
//       padding: const EdgeInsets.symmetric(horizontal: 8),

//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade400),
//         borderRadius: BorderRadius.circular(4),
//       ),

//       child: const Row(
//         children: [

//           Expanded(
//             child: Text(
//               "50",
//               style: TextStyle(fontSize: 12),
//             ),
//           ),

//           Text(
//             "kg",
//             style: TextStyle(fontSize: 11),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget smallTab(String title, bool selected) {

//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 14,
//         vertical: 7,
//       ),

//       decoration: BoxDecoration(
//         color: selected
//             ? const Color(0xff1B1533)
//             : Colors.grey.shade200,

//         borderRadius: BorderRadius.circular(20),
//       ),

//       child: Text(
//         title,

//         style: TextStyle(
//           fontSize: 11,

//           color: selected
//               ? Colors.white
//               : Colors.black,
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class LiveOrdersScreen extends StatefulWidget {
//   const LiveOrdersScreen({super.key});

//   @override
//   State<LiveOrdersScreen> createState() => _LiveOrdersScreenState();
// }

// class _LiveOrdersScreenState extends State<LiveOrdersScreen> {

//   int selectedTopTab = 1;
//   int selectedMenuTab = 0;

//   final List<String> topTabs = [
//     "Schedule",
//     "Live Orders",
//     "Shelf Life Items",
//     "Prepared"
//   ];

//   final List<String> menuTabs = [
//     "Running Orders",
//     "Ala Carte Menu"
//   ];

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       backgroundColor: Colors.white,

//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,

//         titleSpacing: 16,

//         title: const Text(
//           "Kitchen Operations",

//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),

//         actions: [

//           Container(
//             margin: const EdgeInsets.only(right: 16),

//             padding: const EdgeInsets.symmetric(
//               horizontal: 10,
//               vertical: 7,
//             ),

//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.grey.shade300,
//               ),

//               borderRadius: BorderRadius.circular(20),
//             ),

//             child: Row(
//               children: [

//                 const Icon(
//                   Icons.calendar_today,
//                   size: 14,
//                   color: Colors.grey,
//                 ),

//                 const SizedBox(width: 5),

//                 Text(
//                   "22-02-2023",

//                   style: TextStyle(
//                     fontSize: 11,
//                     color: Colors.grey.shade700,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),

//       bottomNavigationBar: BottomNavigationBar(

//         currentIndex: 3,

//         type: BottomNavigationBarType.fixed,

//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,

//         items: const [

//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard_outlined),
//             label: "Dashboard",
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_outlined),
//             label: "Take Orders",
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(Icons.restaurant_menu),
//             label: "Prepare Order",
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_work_outlined),
//             label: "Kitchen Operation",
//           ),
//         ],
//       ),

//       body: Column(
//         children: [

//           const SizedBox(height: 10),

//           /// TOP TABS
//           SizedBox(
//             height: 38,

//             child: ListView.builder(

//               scrollDirection: Axis.horizontal,

//               padding: const EdgeInsets.symmetric(horizontal: 14),

//               itemCount: topTabs.length,

//               itemBuilder: (context, index) {

//                 bool isSelected = selectedTopTab == index;

//                 return GestureDetector(

//                   onTap: () {

//                     setState(() {
//                       selectedTopTab = index;
//                     });
//                   },

//                   child: Container(

//                     margin: const EdgeInsets.only(right: 10),

//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                     ),

//                     alignment: Alignment.center,

//                     decoration: BoxDecoration(

//                       color: isSelected
//                           ? const Color(0xff1B1533)
//                           : Colors.grey.shade100,

//                       borderRadius: BorderRadius.circular(22),
//                     ),

//                     child: Text(

//                       topTabs[index],

//                       style: TextStyle(
//                         fontSize: 11,

//                         fontWeight: FontWeight.w500,

//                         color: isSelected
//                             ? Colors.white
//                             : Colors.black,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           const SizedBox(height: 18),

//           /// MENU TABS
//           Row(
//             children: List.generate(menuTabs.length, (index) {

//               bool selected = selectedMenuTab == index;

//               return Expanded(

//                 child: GestureDetector(

//                   onTap: () {

//                     setState(() {
//                       selectedMenuTab = index;
//                     });
//                   },

//                   child: Column(
//                     children: [

//                       Text(

//                         menuTabs[index],

//                         style: TextStyle(
//                           fontSize: 14,

//                           fontWeight: selected
//                               ? FontWeight.w600
//                               : FontWeight.w400,

//                           color: selected
//                               ? Colors.black
//                               : Colors.grey,
//                         ),
//                       ),

//                       const SizedBox(height: 10),

//                       Container(
//                         height: 2,

//                         color: selected
//                             ? Colors.black
//                             : Colors.transparent,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }),
//           ),

//           const SizedBox(height: 12),

//           Expanded(
//             child: SingleChildScrollView(

//               padding: const EdgeInsets.symmetric(horizontal: 14),

//               child: Column(
//                 children: [

//                   orderCard(),

//                   orderCard(),

//                   orderCard(),

//                   const SizedBox(height: 25),

//                   breakfastSection(),

//                   const SizedBox(height: 25),

//                   requiredSection(),

//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget orderCard() {

//     return Container(

//       margin: const EdgeInsets.only(bottom: 16),

//       padding: const EdgeInsets.all(14),

//       decoration: BoxDecoration(

//         borderRadius: BorderRadius.circular(12),

//         border: Border.all(
//           color: Colors.grey.shade300,
//         ),
//       ),

//       child: Column(
//         children: [

//           /// TOP DATA
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [

//               topText("OrderId", "10098"),

//               topText("Room", "A-101"),

//               topText("Order Status", "Preparing"),

//               topText("Timer", "29:38"),
//             ],
//           ),

//           const SizedBox(height: 16),

//           Divider(color: Colors.grey.shade300),

//           const SizedBox(height: 12),

//           Row(
//             children: [

//               tableHeader("Item Name"),

//               tableHeader("Quantity"),

//               tableHeader("Assigned"),

//               tableHeader("Status"),
//             ],
//           ),

//           const SizedBox(height: 14),

//           orderItem(false),

//           const SizedBox(height: 14),

//           orderItem(false),

//           const SizedBox(height: 14),

//           orderItem(true),

//           const SizedBox(height: 18),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [

//               OutlinedButton(

//                 onPressed: () {},

//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Colors.black),
//                 ),

//                 child: const Text(
//                   "Cancel Order",

//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 11,
//                   ),
//                 ),
//               ),

//               OutlinedButton(

//                 onPressed: () {},

//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Colors.red),
//                 ),

//                 child: const Text(
//                   "Cancel All",

//                   style: TextStyle(
//                     color: Colors.red,
//                     fontSize: 11,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget topText(String title, String value) {

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [

//         Text(

//           title,

//           style: TextStyle(
//             fontSize: 10,
//             color: Colors.grey.shade500,
//           ),
//         ),

//         const SizedBox(height: 4),

//         Text(

//           value,

//           style: const TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget tableHeader(String title) {

//     return Expanded(

//       child: Text(

//         title,

//         style: TextStyle(
//           fontSize: 10,
//           color: Colors.grey.shade500,
//         ),
//       ),
//     );
//   }

//   Widget orderItem(bool assign) {

//     return Row(
//       children: [

//         const Expanded(
//           child: Text(
//             "Butter\nChicken",
//             style: TextStyle(fontSize: 13),
//           ),
//         ),

//         const Expanded(
//           child: Text(
//             "2 × 500g",

//             style: TextStyle(
//               fontSize: 13,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),

//         Expanded(

//           child: assign

//               ? Text(
//             "Assign",

//             style: TextStyle(
//               color: Colors.green.shade700,
//               decoration: TextDecoration.underline,
//               fontSize: 13,
//             ),
//           )

//               : const Text(
//             "Rahul K.",
//             style: TextStyle(fontSize: 13),
//           ),
//         ),

//         Expanded(

//           child: assign

//               ? const Text(
//             "Prepared",
//             style: TextStyle(fontSize: 13),
//           )

//               : Align(
//             alignment: Alignment.centerLeft,

//             child: Container(

//               padding: const EdgeInsets.symmetric(
//                 horizontal: 10,
//                 vertical: 5,
//               ),

//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.red),
//                 borderRadius: BorderRadius.circular(5),
//               ),

//               child: const Text(

//                 "Cancel",

//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 10,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget breakfastSection() {

//     return sectionWidget(
//       selectedIndex: 1,
//       buttonText: "Edit",
//       isSave: false,
//     );
//   }

//   Widget requiredSection() {

//     return sectionWidget(
//       selectedIndex: 2,
//       buttonText: "Save",
//       isSave: true,
//     );
//   }

//   Widget sectionWidget({

//     required int selectedIndex,
//     required String buttonText,
//     required bool isSave,
//   }) {

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [

//         const Text(

//           "Breakfast Menu & Quantity",

//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w600,
//           ),
//         ),

//         const SizedBox(height: 14),

//         Row(
//           children: [

//             smallTab("Prepare", selectedIndex == 0),

//             const SizedBox(width: 10),

//             smallTab("Available", selectedIndex == 1),

//             const SizedBox(width: 10),

//             smallTab("Required", selectedIndex == 2),
//           ],
//         ),

//         const SizedBox(height: 14),

//         Container(

//           padding: const EdgeInsets.all(14),

//           decoration: BoxDecoration(

//             borderRadius: BorderRadius.circular(12),

//             border: Border.all(
//               color: Colors.grey.shade300,
//             ),
//           ),

//           child: Column(
//             children: [

//               Row(
//                 children: [

//                   tableHeader("Item Name"),

//                   tableHeader(
//                     isSave
//                         ? "Required\nQuantity"
//                         : "Available\nQuantity",
//                   ),

//                   tableHeader("Updated by"),
//                 ],
//               ),

//               const SizedBox(height: 18),

//               menuRow(isSave),

//               const SizedBox(height: 16),

//               menuRow(isSave),

//               const SizedBox(height: 18),

//               Align(
//                 alignment: isSave
//                     ? Alignment.centerRight
//                     : Alignment.centerLeft,

//                 child: isSave

//                     ? ElevatedButton(

//                   onPressed: () {},

//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xff1B1533),
//                   ),

//                   child: const Text(
//                     "Save",

//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 )

//                     : OutlinedButton(

//                   onPressed: () {},

//                   child: const Text(
//                     "Edit",

//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget menuRow(bool requiredSection) {

//     return Row(
//       children: [

//         const Expanded(
//           child: Text(
//             "Beef Steak\nPaneer Tikka",
//             style: TextStyle(fontSize: 13),
//           ),
//         ),

//         Expanded(

//           child: requiredSection

//               ? Column(
//             children: [

//               quantityBox(),

//               const SizedBox(height: 8),

//               quantityBox(),
//             ],
//           )

//               : const Text(
//             "100kg\n---",
//             style: TextStyle(fontSize: 13),
//           ),
//         ),

//         const Expanded(
//           child: Text(
//             "Rahul K.\nSalman",
//             style: TextStyle(fontSize: 13),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget quantityBox() {

//     return Container(

//       height: 28,

//       padding: const EdgeInsets.symmetric(horizontal: 8),

//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade400),
//         borderRadius: BorderRadius.circular(4),
//       ),

//       child: const Row(
//         children: [

//           Expanded(
//             child: Text(
//               "50",
//               style: TextStyle(fontSize: 12),
//             ),
//           ),

//           Text(
//             "kg",
//             style: TextStyle(fontSize: 11),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget smallTab(String title, bool selected) {

//     return Container(

//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 8,
//       ),

//       decoration: BoxDecoration(

//         color: selected
//             ? const Color(0xff1B1533)
//             : Colors.grey.shade200,

//         borderRadius: BorderRadius.circular(20),
//       ),

//       child: Text(

//         title,

//         style: TextStyle(
//           fontSize: 11,

//           color: selected
//               ? Colors.white
//               : Colors.black,
//         ),
//       ),
//     );
//   }
// }

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

            /// ================= MENU TAB =================

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

            /// ================= CARDS =================

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

            /// ================= BREAKFAST SECTION =================

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

            /// ================= REQUIRED SECTION =================

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

  /// ================= SIMPLE CARD =================

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

  /// ================= DETAILED CARD =================

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

  /// ================= ITEM =================

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

  /// ================= AVAILABLE TABLE =================

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

  /// ================= REQUIRED TABLE =================

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

  /// ================= COMMON WIDGETS =================

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