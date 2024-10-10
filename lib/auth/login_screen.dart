// ignore_for_file: use_build_context_synchronously, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:swd_app/home/bottom_bar.dart';
import '../utils/colors.dart';
import '../utils/validators.dart';
import '../utils/widgets/app_textfield.dart';
import 'signup/create_acct.dart';

// @RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(
      // text: HiveStorage.get(HiveKeys.hasLoggedIn) ?? false
      //     ? HiveStorage.get(HiveKeys.userEmail)
      //     : ''
      );
  final _passwordController = TextEditingController(

      // text: HiveStorage.get(HiveKeys.hasLoggedIn) ?? false
      //     ? HiveStorage.get(HiveKeys.userPassword)
      //     : ''
      );

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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                //     Colors.deepOrange.shade200,
                //   ],
                // ),
                ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xff1E1E1E),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // child: ,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          'Welcome back 👋🏾',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

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
                    height: 5,
                  ),

                  const Text(
                    'Password',
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.done,
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
                    height: 8,
                  ),

                  InkWell(
                    onTap: () {
                      //
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        // fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  MyButton(
                    // loading: state.loadStatus == Loader.loading,
                    text: 'Sign in',
                    ontap: () async {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return const AlertDialog(
                              icon: Icon(
                                Icons.login_outlined,
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
                                  Text("Welcome to SWD, Please wait..."),
                                ],
                              ),
                            );
                          },
                        );

                        Future.delayed(const Duration(milliseconds: 400), () {
                          Navigator.pop(context);
                          return Navigator.push(context,
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'I don’t have an account,',
                        style: TextStyle(
                          // fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      InkWell(
                        onTap: () {
                          // Handle onTap event
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const SignUpPage();
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
                            'Create account',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors
                                  .white, // Set the text color to white for the ShaderMask to apply properly
                            ),
                          ),
                        ),
                      ),
                    ],
                  )

                  // Gap(52.h),
                  // Center(child: SvgPicture.asset('assets/icons/fingerprint.svg')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
