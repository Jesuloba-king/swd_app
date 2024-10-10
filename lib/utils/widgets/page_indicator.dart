import 'package:flutter/material.dart';

import '../colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const PageIndicator(
      {super.key, required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalPages, (index) {
              return Container(
                width: 150.0,
                height: 5.0,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (currentPage == totalPages)
                      ? Colors.white // Show white for all when on last page
                      : (index == currentPage - 1)
                          ? Colors.white // Show white for current page
                          : const Color(
                              0xff373737), // Faded color for other pages
                ),
              );
            }),
          ),

          //
          // Padding(
          //   padding: const EdgeInsets.only(left: 2.0, top: 20),
          //   child: Row(
          //     children: [
          //       Text(
          //         "Page $currentPage of $totalPages",
          //         style: TextStyle(
          //           fontSize: 10.sp,
          //           color: Colors.black,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox()
        ],
      ),
    );
  }
}
