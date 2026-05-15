import 'package:flutter/material.dart';
import 'package:kitchen_operations/model/model_data.dart';
import 'package:kitchen_operations/view/bottom_navigation_bar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  int selectedIndex = 0;

  List<String> options = [
    "Schedule",
    "Live Orders",
    "Shelf Life Items",
    "Prepared"
  ];

  List<ModelData> data = [

    ModelData(
      startTime: 0,
      endTime: 3,
      color: const Color(0xFFD9F5EA),
    ),

    ModelData(
      startTime: 0,
      endTime: 2,
      color: const Color(0xFFF7F2D8),
    ),

    ModelData(
      startTime: 2,
      endTime: 5,
      color: const Color(0xFFD9F5EA),
    ),

    ModelData(
      startTime: 1,
      endTime: 6,
      color: const Color(0xFFD9F5EA),
    ),

    ModelData(
      startTime: 0,
      endTime: 3,
      color: const Color(0xFFD9F5EA),
    ),

    ModelData(
      startTime: 3,
      endTime: 7,
      color: const Color(0xFFD9F5EA),
    ),

    ModelData(
      startTime: 0,
      endTime: 2,
      color: const Color(0xFFF7F2D8),
    ),

    ModelData(
      startTime: 2,
      endTime: 5,
      color: const Color(0xFFD9F5EA),
    ),

    ModelData(
      startTime: 1,
      endTime: 6,
      color: const Color(0xFFD9F5EA),
    ),
  ];

  List<String> timeSlots = [
    "6am",
    "7am",
    "8am",
    "9pm",
    "10am",
    "11am",
    "12pm",
    "1pm",
    "2pm",
    "3pm",
    "4pm",
    "5pm",
    "6pm",
    "7pm",
    "8pm",
    "9pm",
    "10pm"
  ];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      bottomNavigationBar: const CustomBottomNavigationBar(
        index: 3,
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'Kitchen Operations',

          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [

          const SizedBox(height: 10),

          /// TOP OPTIONS
          SizedBox(
            height: 45,

            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              padding: const EdgeInsets.symmetric(horizontal: 12),

              itemCount: options.length,

              itemBuilder: (context, index) {

                return GestureDetector(

                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },

                  child: Container(
                    margin: const EdgeInsets.only(right: 10),

                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),

                    alignment: Alignment.center,

                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? const Color(0xff1B1533)
                          : Colors.white,

                      borderRadius: BorderRadius.circular(20),

                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),

                    child: Text(
                      options[index],

                      style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,

              child: SizedBox(
                width: 1500,

                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      Row(
                        children: [

                          const SizedBox(width: 90),

                          ...List.generate(timeSlots.length, (index) {

                            return Container(
                              width: 78,
                              height: 45,

                              alignment: Alignment.center,

                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),

                              child: Text(
                                timeSlots[index],
                              ),
                            );
                          }),
                        ],
                      ),

                      Row(
                        children: [

                          const SizedBox(width: 90),

                          Container(
                            width: 50,
                            height: 40,

                            color: const Color(0xff1B1533),

                            alignment: Alignment.center,

                            child: const Text(
                              "06:43\nAM",

                              textAlign: TextAlign.center,

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          leftBox(
                            "Guest\nBuffet",
                            "GuestList",
                          ),

                          mealBox(
                            width: 310,
                            title: "Break Fast",
                            prepTime: "6:00 AM - 8:30 AM",
                            serveTime: "8:30 AM - 11:00 AM",
                          ),

                          mealBox(
                            width: 390,
                            title: "Lunch",
                            prepTime: "11:00 AM - 12:30 PM",
                            serveTime: "12:30 PM - 03:00 PM",
                          ),

                          mealBox(
                            width: 390,
                            title: "Dinner",
                            prepTime: "05:00 PM - 07:30 PM",
                            serveTime: "07:30 PM - 10:00 PM",
                          ),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          leftBox(
                            "Event\nBuffet",
                            "Details",
                          ),

                          Container(
                            width: 310,
                            height: 180,

                            alignment: Alignment.center,

                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),

                            child: const Text("N/A"),
                          ),

                          eventBox(
                            width: 390,
                            title: "Lunch",
                            eventName: "Event Name 1",
                            prepTime: "10:00 AM - 12:00 PM",
                            serveTime: "12:00 PM - 2:30 PM",
                          ),

                          eventBox(
                            width: 390,
                            title: "Dinner",
                            eventName: "Event Name 2",
                            prepTime: "5:00 PM - 7:00 PM",
                            serveTime: "7:00 PM - 9:30 PM",
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      ListView.builder(
                        shrinkWrap: true,

                        physics: const NeverScrollableScrollPhysics(),

                        itemCount: data.length,

                        itemBuilder: (context, index) {

                          return ChefSchedule(
                            data: data[index],
                          );
                        },
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget leftBox(String title, String subtitle) {

  return Container(
    width: 90,
    height: 180,

    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey.shade300,
      ),
    ),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          title,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 8),

        Text(
          subtitle,

          style: const TextStyle(
            color: Colors.green,
            fontSize: 11,
          ),
        ),
      ],
    ),
  );
}

Widget mealBox({
  required double width,
  required String title,
  required String prepTime,
  required String serveTime,
}) {

  return Container(
    width: width,
    height: 180,

    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey.shade300,
      ),
    ),

    child: Column(
      children: [

        const SizedBox(height: 15),

        Text(
          title,

          style: const TextStyle(
            fontSize: 22,
          ),
        ),

        const SizedBox(height: 25),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            mealColumn(
              "Preparation Time",
              prepTime,
              "Menu",
            ),

            mealColumn(
              "Serve Time",
              serveTime,
              "Live Counter",
            ),
          ],
        ),
      ],
    ),
  );
}

Widget mealColumn(
    String title,
    String time,
    String link,
    ) {

  return Column(
    children: [

      Text(
        title,
        style: const TextStyle(fontSize: 12),
      ),

      const SizedBox(height: 6),

      Text(
        time,
        style: const TextStyle(fontSize: 11),
      ),

      const SizedBox(height: 8),

      Text(
        link,

        style: const TextStyle(
          color: Colors.green,
          fontSize: 12,
          decoration: TextDecoration.underline,
        ),
      ),
    ],
  );
}

Widget eventBox({
  required double width,
  required String title,
  required String eventName,
  required String prepTime,
  required String serveTime,
}) {

  return Container(
    width: width,
    height: 180,

    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey.shade300,
      ),
    ),

    child: Column(
      children: [

        const SizedBox(height: 15),

        Text(
          title,

          style: const TextStyle(
            fontSize: 22,
          ),
        ),

        const SizedBox(height: 25),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Column(
              children: [

                Text(
                  eventName,
                  style: const TextStyle(fontSize: 12),
                ),

                const SizedBox(height: 4),

                const Text(
                  "Preparation Time",
                  style: TextStyle(fontSize: 10),
                ),

                const SizedBox(height: 4),

                Text(
                  prepTime,
                  style: const TextStyle(fontSize: 11),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Menu",

                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),

            Column(
              children: [

                Text(
                  eventName,
                  style: const TextStyle(fontSize: 12),
                ),

                const SizedBox(height: 4),

                const Text(
                  "Serve Time",
                  style: TextStyle(fontSize: 10),
                ),

                const SizedBox(height: 4),

                Text(
                  serveTime,
                  style: const TextStyle(fontSize: 11),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Live Counter",

                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

class ChefSchedule extends StatelessWidget {

  final ModelData data;

  const ChefSchedule({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    double slotWidth = 78;

    bool isYellow = data.color == const Color(0xFFF7F2D8);

    Color textColor = isYellow
        ? const Color(0xffC7A728)
        : const Color(0xff19A26D);

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Row(
        children: [

          const SizedBox(width: 90),

          SizedBox(
            width: data.startTime * slotWidth,
          ),

          Container(
            width:
            ((data.endTime - data.startTime) + 2.5)
                * slotWidth,

            height: 40,

            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),

            decoration: BoxDecoration(
              color: data.color,
              borderRadius: BorderRadius.circular(4),
            ),

            child: Row(
              children: [

                Expanded(
                  child: Text(
                    "3:45/8hour",

                    overflow: TextOverflow.ellipsis,

                    style: TextStyle(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Expanded(
                  child: Text(
                    "Rajeev Singh",

                    textAlign: TextAlign.center,

                    overflow: TextOverflow.ellipsis,

                    style: TextStyle(
                      color: textColor,
                      fontSize: 13,
                    ),
                  ),
                ),

                Container(
                  width: 1,
                  height: 16,
                  color: textColor,
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    "Head Chef",

                    textAlign: TextAlign.center,

                    overflow: TextOverflow.ellipsis,

                    style: TextStyle(
                      color: textColor,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

