import 'package:flutter/material.dart';

import '../colors.dart';
import 'app_loader.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.textColor,
    this.borderColor,
    this.buttonColor,
    this.text,
    this.ontap,
    this.isFocused = false,
    this.padding,
    this.height,
    this.width,
    this.loading = false,
    this.borderRadius,
  });

  final Color? textColor;
  final Color? buttonColor;
  final Color? borderColor;
  final String? text;
  final bool isFocused;
  final bool loading;
  final void Function()? ontap;
  final double? padding, width, height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : ontap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? double.infinity,
        height: height ?? 50,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? AppColors.primaryColor),
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          color: buttonColor ?? AppColors.primaryColor,
          // boxShadow: [
          //   BoxShadow(
          //     color: AppColors.secondaryColor.withOpacity(0.3),
          //     offset: const Offset(0, 4),
          //     blurRadius: 9,
          //   ),
          // ],
        ),
        child: loading
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Loading',
                    style: TextStyle(
                      color: Colors.white,
                      // fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppLoader(size: 40, color: Colors.white),
                ],
              )
            : Text(
                text ?? 'Continue',
                style: TextStyle(
                  // fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: textColor ?? Colors.white,
                ),
              ),
      ),
    );
  }
}
