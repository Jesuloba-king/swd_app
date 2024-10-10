// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'homepage.dart';
import 'referral_page.dart';
import 'service.dart';
import 'settings.dart';
import 'statistics.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _currentIndex = 0; // Current selected index

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
      floatingActionButton: GradientFloatingActionButton(),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_vert),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline_outlined),
            label: 'Referral',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        currentIndex: _currentIndex,
        selectedLabelStyle: TextStyle(
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
            // Define your action here
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
