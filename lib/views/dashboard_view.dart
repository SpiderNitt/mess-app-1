import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final List<String> meals = ["Breakfast", "Lunch", "Snacks", "Dinner"];
  String day = "Fri";
  List<Map<String, dynamic>> stats = [
    {'domain': 'Sun', 'measure': 600},
    {'domain': 'Mon', 'measure': 400},
    {'domain': 'Tue', 'measure': 390},
    {'domain': 'Wed', 'measure': 500},
    {'domain': 'Thu', 'measure': 400},
    {'domain': 'Fri', 'measure': 245},
    {'domain': 'Sat', 'measure': 0}
  ];
  String? meal = "Breakfast";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 0.6,
            colors: [
              Color.fromRGBO(97, 206, 255, 0.72),
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 46, 24, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Dashboard",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(14, 190, 127, 1),
                        fontFamily: 'Rubik',
                        letterSpacing: -0.3),
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                const Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Mega Mess II",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Rubik',
                        letterSpacing: -0.3),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Text(
                            "3.7",
                            style: TextStyle(
                                fontFamily: 'Mina',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(18, 13, 38, 1)),
                          ),
                          Text(
                            "Mess Rating",
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(116, 118, 136, 1)),
                          ),
                        ],
                      ),
                      const VerticalDivider(
                        indent: 10,
                        endIndent: 5,
                        thickness: 1,
                        color: Color.fromRGBO(221, 221, 221, 1),
                        width: 20,
                      ),
                      Column(
                        children: const [
                          Text(
                            "998",
                            style: TextStyle(
                                fontFamily: 'Mina',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(18, 13, 38, 1)),
                          ),
                          Text(
                            "Registrations (Mon)",
                            style: TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(116, 118, 136, 1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 295,
                    height: 54,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(14, 190, 127, 1),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 98,
                        ),
                        const Text(
                          'Tap to Scan',
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            color: Colors.white,
                            letterSpacing: -0.3,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 46.5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 32.5,
                            height: 32.5,
                            child: Image.asset(
                              "assets/images/scan_icon.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Lunch",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Rubik',
                        color: Color.fromRGBO(14, 190, 127, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "245",
                          style: TextStyle(
                            color: Color.fromRGBO(18, 13, 38, 1),
                            fontFamily: 'Mina',
                            fontSize: 60,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Scanned",
                          style: TextStyle(
                            color: Color.fromRGBO(116, 118, 136, 1),
                            fontFamily: 'Rubik',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          "753",
                          style: TextStyle(
                            color: Color.fromRGBO(18, 13, 38, 1),
                            fontFamily: 'Mina',
                            fontSize: 60,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Remaining",
                          style: TextStyle(
                            color: Color.fromRGBO(116, 118, 136, 1),
                            fontFamily: 'Rubik',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 29,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "458",
                          style: TextStyle(
                            color: (meal == "Breakfast")
                                ? const Color.fromRGBO(14, 190, 127, 1)
                                : const Color.fromRGBO(18, 13, 38, 1),
                            fontFamily: 'Mina',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          "Breakfast",
                          style: TextStyle(
                            color: Color.fromRGBO(116, 118, 136, 1),
                            fontFamily: 'Rubik',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "245",
                          style: TextStyle(
                            color: (meal == "Lunch")
                                ? const Color.fromRGBO(14, 190, 127, 1)
                                : const Color.fromRGBO(18, 13, 38, 1),
                            fontFamily: 'Mina',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          "Lunch",
                          style: TextStyle(
                            color: Color.fromRGBO(116, 118, 136, 1),
                            fontFamily: 'Rubik',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                            color: (meal == "Snacks")
                                ? const Color.fromRGBO(14, 190, 127, 1)
                                : const Color.fromRGBO(18, 13, 38, 1),
                            fontFamily: 'Mina',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          "Snacks",
                          style: TextStyle(
                            color: Color.fromRGBO(116, 118, 136, 1),
                            fontFamily: 'Rubik',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                            color: (meal == "Dinner")
                                ? const Color.fromRGBO(14, 190, 127, 1)
                                : const Color.fromRGBO(18, 13, 38, 1),
                            fontFamily: 'Mina',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          "Dinner",
                          style: TextStyle(
                            color: Color.fromRGBO(116, 118, 136, 1),
                            fontFamily: 'Rubik',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 44,
                    width: 183,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromRGBO(16, 24, 40, 0.05)),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: meal,
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(102, 112, 133, 1),
                          ),
                          items: meals.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              meal = value;
                            });
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: DChartBar(
                      data: [
                        {'id': 'Bar', 'data': stats},
                      ],
                      domainLabelPaddingToAxisLine: 16,
                      axisLineTick: 2,
                      axisLinePointTick: 2,
                      axisLinePointWidth: 10,
                      axisLineColor: const Color.fromRGBO(238, 240, 243, 1),
                      measureLabelPaddingToAxisLine: 16,
                      barColor: (barData, index, id) {
                        if (day != barData['domain']) {
                          return const Color.fromRGBO(116, 118, 136, 1);
                        } else {
                          return const Color.fromRGBO(14, 190, 127, 1);
                        }
                      },
                      showBarValue: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
