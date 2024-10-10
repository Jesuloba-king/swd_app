import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../auth/signup/user_model.dart';
import '../utils/widgets/app_textfield.dart';
import 'bottom_bar.dart';

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
    final userModel = context.watch<UserModel>();
    String name = "Sam";
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
                        InkWell(
                          onTap: () {
                            // Navigate to the settings page in the BottomNavBarPage
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BottomNavBarPage(
                                  initialIndex: 4), // Settings page index
                            ));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.8, color: Colors.black)),
                            child: SvgPicture.asset("assets/image/User_01.svg"),
                          ),
                        ),
                        Text(
                          "Welcome, ${userModel?.firstName?.isNotEmpty == true ? userModel.firstName : name} 👋🏾",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Color(0xff141414)),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Notification"),
                                    content: const Text(
                                        "Notification not available ..."),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Dismiss"),
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.8, color: Colors.black)),
                            child: SvgPicture.asset("assets/image/bell.svg"),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    //
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 12, right: 12),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
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

                    const SizedBox(
                      height: 25,
                    ),

                    //top up, transfer, history

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(" "),
                                    content: const Text("Top up not available"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Dismiss"),
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/image/top_up.svg",
                                height: 26,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Top up",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4B4B4B)),
                              ),
                            ],
                          ),
                        ),

                        //
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: const Color(0xffD6D6D6).withOpacity(0.60),
                          ),
                        ),

                        //transfer
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(" "),
                                    content:
                                        const Text("No Transfer was performed"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Dismiss"),
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/image/transfer.svg",
                                height: 26,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Transfer",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4B4B4B)),
                              ),
                            ],
                          ),
                        ),

                        //
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: const Color(0xffD6D6D6).withOpacity(0.60),
                          ),
                        ),

                        //history
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(" "),
                                    content: const Text("No History"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Dismiss"),
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/image/history.svg",
                                height: 26,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "History",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4B4B4B)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 26,
                    ),

                    //
                    Container(
                      height: 6,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xffE9E9E9),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              // flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 35, left: 12, right: 12.0, bottom: 15),
                child: SingleChildScrollView(
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
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1 / 1.2,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Quick Action"),
                                        content: Text(
                                            "${items[index]['name']} Service coming soon ..."),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Close"),
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                height: 80,
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
                                      items[index]['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(
                        height: 40,
                      ),

                      //News & updates
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "News & Update",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("News & Update"),
                                      content: const Text(
                                          "All News & Update content goes here."),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Close"),
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: const Text(
                              "View all",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffEF5858)),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          // padding: const EdgeInsets.all(0),
                          physics: const BouncingScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset(
                                    "assets/image/news_action.png"));
                          },
                        ),
                      ),

                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
