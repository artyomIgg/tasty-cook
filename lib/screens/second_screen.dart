import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        color: Colors.amber,
        child: Align(
          child: Text(
            'Second Screen',
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
