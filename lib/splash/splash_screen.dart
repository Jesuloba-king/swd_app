import 'package:flutter/material.dart';
import 'package:swd_app/auth/login_screen.dart';

import '../utils/colors.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({
    super.key,
  });

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _firstAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _firstAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.33, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
    _nextPage();
  }

  Future _nextPage() async {
    await Future.delayed(const Duration(seconds: 3), () {
      // Replace with your navigation logic
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gap(40.h),

            //
            FadeTransition(
              opacity: _firstAnimation,
              child: const Hero(
                tag: 'logo1',
                child: Text(
                  "S W D",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
