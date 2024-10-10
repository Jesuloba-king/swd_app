// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../home/bottom_bar.dart';
import '../../utils/colors.dart';
import '../../utils/widgets/app_textfield.dart';
import '../../utils/widgets/page_indicator.dart';
// import 'package:flutter_svg/svg.dart';

// @RoutePage()
class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key, required this.email});

  final String email;

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  // final otpController = TextEditingController();
  final List<TextEditingController> otpController =
      List.generate(6, (index) => TextEditingController());

  void _onChanged(String value, int index) {
    if (value.length == 1) {
      if (index < 5) {
        FocusScope.of(context).nextFocus(); // Move to the next field
      }
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus(); // Move to the previous field
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    for (var controller in otpController) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                alignment: Alignment.topRight,
                scale: 0.8,
                image: AssetImage('assets/image/light.png'))
            // gradient: LinearGradient(
            //   colors: [
            //     Colors.black,
            //     Colors.deepOrange.shade200,
            //   ],
            // ),
            ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // Handle onTap event
                          Navigator.pop(context);
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Back',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Verify your email',
                    style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  //
                  const Text(
                    "Please enter the OTP sent to",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 6,
                  ),

                  //
                  Text(
                    widget.email,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: List.generate(6, (index) {
                  //     return OtpTextField(
                  //       controller: otpController[index],
                  //       onChanged: (value) => _onChanged(value, index),
                  //     );
                  //   }),
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return OtpTextField(
                            controller: otpController[index],
                            onChanged: (value) => _onChanged(value, index),
                          );
                        }),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0),
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontFamily: 'Aeonik',
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return OtpTextField(
                            controller: otpController[
                                index + 3], // Last three controllers
                            onChanged: (value) => _onChanged(value, index + 3),
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              MyButton(
                // loading: state.loadStatus == Loader.loading,
                text: 'Verify email',
                ontap: () async {
                  if (_formKey.currentState!.validate()) {
                    String otp = otpController
                        .map((controller) => controller.text)
                        .join('');
                    // ignore: avoid_print
                    print('Entered OTP: $otp');

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return const AlertDialog(
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.black,
                            size: 50,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircularProgressIndicator.adaptive(),
                              SizedBox(
                                height: 12,
                              ),
                              Text("Verifying email, please wait..."),
                            ],
                          ),
                        );
                      },
                    );

                    Future.delayed(const Duration(milliseconds: 400), () {
                      Navigator.pop(context);
                      return Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const BottomNavBarPage();
                      }));
                    });
                  } else {
                    // Handle failure
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return SWDDialog(
                          icon: const Icon(
                            Icons.error,
                            color: AppColors.red,
                            size: 50,
                          ),
                          title: "Try Again",
                          subtitle: "All fields are required",
                          buttonColor: AppColors.red,
                          textColor: Colors.white,
                          buttonText: 'Dismiss',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              const PageIndicator(
                totalPages: 2,
                currentPage: 2,
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Email verification',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color(0xffA4A4A4),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class OtpTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const OtpTextField(
      {super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 52,
      margin: const EdgeInsets.symmetric(horizontal: 3), // Gap between fields
      decoration: BoxDecoration(
        color: const Color(0xFF292929), // Background color
        border: Border.all(color: const Color(0xFF515151)), // Border color
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          maxLength: 1, // Limit to one character
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontFamily: 'Aeonik',
            fontWeight: FontWeight.w400,
            fontSize: 24,
            color: Colors.white, // Text color
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ], // Allow only digits
          decoration: const InputDecoration(
            counterText: '', // Hide the counter text
            border: InputBorder.none, // Remove default border
          ),
        ),
      ),
    );
  }
}
