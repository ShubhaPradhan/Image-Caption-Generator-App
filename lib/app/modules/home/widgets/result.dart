import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/demo-image.jpg',
                height: 40.h,
                width: 100.w,
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Generated Caption',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                '"A dog is in front of tall grass"',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
