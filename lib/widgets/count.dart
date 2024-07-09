import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/config/colors.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 50.w,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      child: isTrue == true
          ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              InkWell(
                  onTap: () {
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                    }
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                    }
                  },
                  child: Icon(Icons.remove, size: 15.sp, color: primaryColor)),
              Text("$count",
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold)),
              InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Icon(Icons.add, size: 15.sp, color: primaryColor))
            ])
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                },
                child: Text(
                  'ADD',
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
    );
  }
}
