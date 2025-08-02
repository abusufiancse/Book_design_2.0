import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_book_new.dart';

class GlassEffect extends StatelessWidget {
  const GlassEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          height: 210.h,
          width: 190.w,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            // color: Colors.red,
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.15)),
          ),
          child: Center(
            child: CustomImageCardNew(
              imageUrl:
                  'https://wafilife-media.wafilife.com/uploads/2021/04/message-01-250x379.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
