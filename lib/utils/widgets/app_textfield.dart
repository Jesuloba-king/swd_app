// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';
import 'app_button.dart';
// import 'package:intl/intl.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    this.controller,
    this.onTap,
    this.heightPadding,
    this.width,
    required this.labelText,
    this.suffixIcon,
    this.initalValue,
    this.enabled,
    this.maxLines,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.maxLength,
    this.suffix,
    this.backgroundColor,
    this.borderWidth,
    this.onChanged,
    this.textColor,
    this.prefixIcon,
    this.focusNode,
    this.textInputAction,
    this.helperText,
    this.autovalidateMode,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final double? heightPadding;
  final double? width;
  final String labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? initalValue;
  final bool? enabled;
  final int? maxLines;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLength;
  final Widget? suffix;
  final Color? backgroundColor;
  final double? borderWidth;
  final Color? textColor;
  final FocusNode? focusNode;
  AutovalidateMode? autovalidateMode;
  final String? helperText;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        focusNode: focusNode,
        maxLength: maxLength,
        obscureText: obscureText,
        autovalidateMode: autovalidateMode,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onTapOutside: (event) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        validator: validator,
        maxLines: maxLines ?? 1,
        enabled: enabled,
        initialValue: initalValue,
        onTap: onTap,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        readOnly: onTap != null,
        cursorColor: AppColors.grey,
        controller: controller,
        style: const TextStyle(
            color: Colors.white,
            // fontSize: 15,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          suffix: suffix,
          isDense: true,
          counter: const Text(''),
          helperText: helperText,
          errorStyle: const TextStyle(fontSize: 13),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: const Color(0xff515151),
          filled: true,
          // counterText: '',
          hintText: labelText,
          contentPadding: EdgeInsets.symmetric(
              vertical: heightPadding ?? 15, horizontal: 15),
          hintStyle: const TextStyle(
            // fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.grey,
              width: borderWidth ?? 0.6,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.grey,
              width: borderWidth ?? 0.6,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.grey,
              width: borderWidth ?? 0.6,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(
              color: AppColors.grey,
              width: borderWidth ?? 0.6,
            ),
          ),
          errorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(
              color: AppColors.red,
              width: borderWidth ?? 0.6,
            ),
          ),
        ));
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.ontap,
    this.buttonColor,
  });
  final String text;
  final void Function() ontap;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.center,
            // end: Alignment.center,
            colors: [
              Color(0xffEF5858),
              Color(0xffEFA058),
            ],
          ),
          // color: buttonColor ?? AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

//
class SWDDialog extends StatelessWidget {
  const SWDDialog({
    super.key,
    this.title = '',
    this.subtitle = '',
    this.onTap,
    this.buttonText,
    this.buttonColor,
    this.textColor,
    this.icon,
  });
  final String title;
  final String subtitle;
  final void Function()? onTap;
  final String? buttonText;
  final Widget? icon;
  final Color? buttonColor, textColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ??
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),

          // SvgPicture.asset(
          //   "assets/icons/success.svg",
          //   // ignore: deprecated_member_use
          //   color: Colors.green,
          // ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 13,
                color: AppColors.black,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        AppButton(
          buttonColor: buttonColor,
          borderColor: buttonColor,
          textColor: textColor ?? Colors.white,
          text: buttonText ?? "Continue",
          ontap: onTap,
        ),
      ],
    );
  }
}

class WalletBalance extends StatefulWidget {
  const WalletBalance({super.key});

  @override
  State<WalletBalance> createState() => _WalletBalanceState();
}

class _WalletBalanceState extends State<WalletBalance> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "WALLET BALANCE",
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        Row(
          children: [
            Text(
              _isObscure ? "NGN 50,000" : "NGN ******",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              child: Icon(
                  _isObscure ? Icons.visibility_outlined : Icons.visibility_off,
                  size: 15,
                  color: Colors.white),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.60),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              const Text(
                "Cashback",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff282828)),
              ),
              const SizedBox(
                width: 5,
              ),

              //
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    Color(0xffEF5858),
                    Color(0xffEFA058),
                  ], // Your gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  'N341.20',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Colors
                        .white, // Set the text color to white for the ShaderMask to apply properly
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AcctNumber extends StatelessWidget {
  const AcctNumber({super.key});

  final String number = "8192017482";

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: number)).then((_) {
      // Show a snackbar message after copying
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xffEFA058),
          content: Text(
            'Copied to clipboard!',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          duration: Duration(seconds: 1),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      // width: ,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          color: Colors.white.withOpacity(0.20)
          // color: buttonColor ?? AppColors.primaryColor,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "MONIEPOINT",
            style: TextStyle(
                fontSize: 11, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          Row(
            children: [
              Text(
                number,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () {
                  _copyToClipboard(context);
                },
                child: const Icon(Icons.copy_outlined,
                    size: 15, color: Colors.white),
              ),
            ],
          ),
          const Text(
            "Deposit Fee: N20",
            style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
