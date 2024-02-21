import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sm_iot_lab/constants/colors.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.bgGray,
            ),
            height: ScreenUtil().setHeight(60),
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Scanner 0",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "up",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.bgGray,
            ),
            height: ScreenUtil().setHeight(60),
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Scanner 1",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "up",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.bgGray,
            ),
            height: ScreenUtil().setHeight(60),
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pickup Point 0",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "up",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.bgGray,
            ),
            height: ScreenUtil().setHeight(60),
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pickup Point 1",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "down",
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(18),
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
