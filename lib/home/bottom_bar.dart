// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'homepage.dart';
import 'referral_page.dart';
import 'service.dart';
import 'settings.dart';
import 'statistics.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key, this.initialIndex = 0});

  final int initialIndex;
  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _pages = [
    const HomePage(),
    const ServicesScreen(),
    const StatisticsScreen(),
    const ReferralScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Update the current index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const GradientFloatingActionButton(),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/image/House_01.svg',
              color: Colors.white,
            ),
            icon: SvgPicture.asset(
              'assets/image/House_01.svg',
              color: const Color(0xff363636),
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/image/Arrow_Down_Up.svg',
                color: Colors.white),
            icon: SvgPicture.asset(
              'assets/image/Arrow_Down_Up.svg',
              color: const Color(0xff363636),
            ),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/image/refferral.svg',
              color: Colors.white,
            ),
            icon: SvgPicture.asset(
              'assets/image/refferral.svg',
              color: const Color(0xff363636),
            ),
            label: 'Referral',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset('assets/image/Settings.svg',
                color: Colors.white),
            icon: SvgPicture.asset(
              'assets/image/Settings.svg',
              color: const Color(0xff363636),
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: _currentIndex,
        selectedLabelStyle: const TextStyle(
          // fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xff363636),
        backgroundColor: const Color(0xff141414),
        onTap: _onItemTapped, // Handle item tap
      ),
    );
  }
}

// Sample screens for each tab

class GradientFloatingActionButton extends StatelessWidget {
  const GradientFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 56, // Size of the FAB
          height: 56, // Size of the FAB
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffEF5858),
                Color(0xffEFA058),
              ], // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            showMenu(
              context: context,
              position: const RelativeRect.fromLTRB(100, 0, 0, 0),
              items: [
                const PopupMenuItem<String>(
                  value: 'call',
                  child: Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 8),
                      Text('Call Support'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'sms',
                  child: Row(
                    children: [
                      Icon(Icons.message),
                      SizedBox(width: 8),
                      Text('SMS Support'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'email',
                  child: Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 8),
                      Text('Email Support'),
                    ],
                  ),
                ),
              ],
            ).then((value) {
              if (value != null) {
                // Handle the selected value here
                if (kDebugMode) {
                  print("Selected option: $value");
                }
              }
            });
          },
          backgroundColor: Colors.transparent, // Make background transparent
          elevation: 0, // Remove shadow
          child: SvgPicture.asset(
              "assets/image/chat_bubble.svg"), // Your SVG asset
        ),
      ],
    );
  }
}
