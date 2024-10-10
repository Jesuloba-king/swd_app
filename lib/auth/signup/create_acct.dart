// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swd_app/auth/signup/verify_acct.dart';

import '../../utils/colors.dart';
import '../../utils/validators.dart';
import '../../utils/widgets/app_textfield.dart';
import '../../utils/widgets/page_indicator.dart';
import '../login_screen.dart';
// import 'package:flutter_svg/svg.dart';

// @RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();

  final firstController = TextEditingController();
  final lastController = TextEditingController();
  final _passwordController = TextEditingController();

  final phoneController = TextEditingController();

  final refCode = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  void dispose() {
    super.dispose();
    // _emailController.dispose();
    // _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(loginNotifierProvider);
    // final model = ref.read(loginNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
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
              //     Colors.deepOrange.shade100,
              //   ],
              // ),
              ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // Handle onTap event
                          Navigator.pop(context);
                        },
                        child: const Row(
                          children: [
                            const Icon(
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
                      InkWell(
                        onTap: () {
                          // Handle onTap event
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const LoginScreen();
                          }));
                        },
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Color(0xffEF5858),
                              Color(0xffEFA058),
                            ], // Your gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: const Text(
                            'Sign in instead',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'First Name',
                              style: TextStyle(
                                // fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            AppTextField(
                              labelText: 'First name',
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: firstController,
                              keyboardType: TextInputType.text,
                              validator: (value) =>
                                  FieldValidator.validateEmptyfield(value!),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        width: 12,
                      ),

                      //last name field
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Last Name',
                              style: TextStyle(
                                // fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            AppTextField(
                              labelText: 'Last name',
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: lastController,
                              keyboardType: TextInputType.text,
                              validator: (value) =>
                                  FieldValidator.validateField(value!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const Text(
                    'Phone number',
                    style: TextStyle(
                      // fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AppTextField(
                    labelText: 'Enter phone number',
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLength: 11,
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) =>
                        PhoneNumberValidator.validatePhoneNumber(value!),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //email field

                  const Text(
                    'Email address',
                    style: TextStyle(
                      // fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  AppTextField(
                    labelText: 'Enter Email',
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => EmailValidator.validateEmail(value!),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //password
                  const Text(
                    'Create Password',
                    style: TextStyle(
                      // fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  AppTextField(
                    labelText: 'Enter Password',
                    controller: _passwordController,
                    obscureText: _isObscure,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        PasswordValidator.validatePassword(value!),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                          _isObscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off,
                          color: Colors.white),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  //email field

                  const Text(
                    'Referral Code (Optional)',
                    style: TextStyle(
                      // fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  AppTextField(
                    labelText: 'Enter Referral Code',
                    textInputAction: TextInputAction.done,
                    controller: refCode,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        FieldValidator.validateEmptyfield(value!),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  MyButton(
                    // loading: state.loadStatus == Loader.loading,
                    text: 'Next',
                    ontap: () async {
                      if (
                          // _formKey.currentState!.validate()
                          _emailController.text.isNotEmpty &&
                              firstController.text.isNotEmpty &&
                              lastController.text.isNotEmpty &&
                              _passwordController.text.isNotEmpty &&
                              phoneController.text.isNotEmpty) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return const AlertDialog(
                              icon: Icon(
                                Icons.person,
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
                                  Text("Please wait..."),
                                ],
                              ),
                            );
                          },
                        );

                        Future.delayed(const Duration(milliseconds: 400), () {
                          Navigator.pop(context);
                          return Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return VerifyPage(
                              email: _emailController.text,
                            );
                          }));
                        });

                        // Navigator.pop(context);
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
                    currentPage: 1,
                  ),

                  const SizedBox(height: 20),

                  const Center(
                    child: Text(
                      'Account information',
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
        ),
      ),
    );
  }
}
