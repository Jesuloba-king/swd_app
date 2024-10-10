import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/widgets/app_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> items = [
    {'name': 'Data', 'icon': "assets/image/data.svg"},
    {'name': 'Airtime', 'icon': "assets/image/airtime.svg"},
    {'name': 'Showmax', 'icon': "assets/image/showmax.svg"},
    {'name': 'Giftcards', 'icon': "assets/image/gift_card.svg"},
    {'name': 'Betting', 'icon': "assets/image/betting.svg"},
    {'name': 'Electricity', 'icon': "assets/image/electricty.svg"},
    {'name': 'TV/Cable', 'icon': "assets/image/tv_cable.svg"},
    {'name': 'E-PIN', 'icon': "assets/image/e-pin.svg"},
  ];

  final List<Map<String, dynamic>> majorItems = [
    {'name': 'Top up', 'icon': "assets/image/top_up.svg"},
    {'name': 'Transfer', 'icon': "assets/image/transfer.svg"},
    {'name': 'History', 'icon': "assets/image/history.svg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 375,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15.0, top: 35, bottom: 0),
                child: Column(
                  children: [
                    // SizedBox
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.8, color: Colors.black)),
                          child: SvgPicture.asset("assets/image/User_01.svg"),
                        ),
                        const Text(
                          "Welcome, Sam 👋🏾",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff141414)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.8, color: Colors.black)),
                          child: SvgPicture.asset("assets/image/bell.svg"),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    //
                    Container(
                      padding: const EdgeInsets.all(18),
                      // width: ,
                      decoration: const BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          // end: Alignment.center,
                          colors: [
                            Color(0xffEF5858),
                            Color(0xffEFA058),
                          ],
                        ),
                        // color: buttonColor ?? AppColors.primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const WalletBalance(),
                          SizedBox(
                            height: 70,
                            child: VerticalDivider(
                              color: const Color(0xffD04E4E).withOpacity(0.60),
                            ),
                          ),
                          const AcctNumber()
                        ],
                      ),
                    ),

                    //top up, transfer, airtime
                    GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 7 / 5,
                        ),
                        itemCount: majorItems.length, // Total number of items
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                majorItems[index]['icon'],
                                height: 26,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                majorItems[index]
                                    ['name'], // Dynamic text for each item
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4B4B4B)),
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
              // flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 35, left: 12, right: 12.0, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Quick Actions",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1 / 1,
                      ),
                      itemCount: 8, // Total number of items
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: 75,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff282828),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  items[index]['icon'],
                                  height: 30,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  items[index]
                                      ['name'], // Dynamic text for each item
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
