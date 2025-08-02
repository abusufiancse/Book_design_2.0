import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageCardNew extends StatelessWidget {
  final String imageUrl;

  const CustomImageCardNew({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    return  ClipRRect(
      borderRadius:  BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          height: 185.h,
          width: 150.w,
          decoration: BoxDecoration(
            // color: Colors.red,
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.15)),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Shadow for the book
              Positioned(
                top: 20.5,
                left: 33,
                child: Container(
                  width: 123,
                  height: 176,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0.5, 0.1,),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 18.5,
                left: 24.55,
                child: Container(
                  width: 123,
                  height: 164,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 21.5,
                child: Container(
                  width: 125,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: const Offset(2, 2),
                        blurRadius: 3,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(2, -2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 21.5,
                left: 20,
                child: Container(
                  width: 125,
                  height: 157.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(2, 2),
                        blurRadius: 3,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: const Offset(2, -2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 22,
                left: 19,
                child: Container(
                  width: 125,
                  height: 156,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(2, 2),
                        blurRadius: 3,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: const Offset(2, -2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 22,
                left: 18,
                child: Container(
                  width: 124,
                  height: 156,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(2, 2),
                        blurRadius: 3,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: const Offset(2, -2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 22,
                left: 18,
                child: Container(
                  width: 123,
                  height: 156,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(2, 2),
                        blurRadius: 3,
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: const Offset(2, -2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 16.5,
                left: 16.5,
                child: Container(
                  width: 123.8,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(3),
                      right: Radius.circular(4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: const Offset(2, -2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(3),
                      right: Radius.circular(4),
                    ),
                    child: Stack(
                      children: [
                        /// The Background Image
                        CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => const Center(
                            child: Icon(Icons.image, size: 50, color: Colors.grey),
                          ),
                        ),

                        /// First Vertical Divider (Left side)
                        Positioned(
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 1.5,
                            color: Colors.black12.withOpacity(0.05),
                          ),
                        ),

                        /// Second Vertical Divider (upper)
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 5.5,
                          child: Container(
                            width: 4,
                            color: Colors.black12.withOpacity(0.05),
                          ),
                        ),

                        /// Second Vertical Divider (bottom)
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 7,
                          child: Container(
                            width: 1,
                            color: Colors.black12.withOpacity(0.1),
                          ),
                        ),

                        // Right Side
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 9,
                          child: Container(
                            width: 4,
                            color: Colors.white.withOpacity(0.05),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
