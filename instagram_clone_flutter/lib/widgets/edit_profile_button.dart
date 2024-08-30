
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_widgets/widgets/screen_utils.dart';

class Editprofilebuttons extends StatelessWidget {
  const Editprofilebuttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                height: 32.h,
                decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                    child: Text('Edit Profile',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold))))),
        Expanded(
          child: Container(
            height: 32.h,
            decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(8)),
            child: const Center(
                child: Text(
              'Share Profile',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ).wrapPaddingHorizontal(10.w),
        ),
        Container(
          height: 30.h,
          width: 30.w,
          decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(8)),
          child: const Center(
            child: Icon(
              Icons.person_add,
              color: Colors.white,
            ),
          ),
        ).wrapPaddingHorizontal(5.w),
      ],
    );
  }
}
