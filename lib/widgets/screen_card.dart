import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_intern_assignment/config/app_color.dart';
import 'package:flutter_mobile_intern_assignment/widgets/screen_card_clipper.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenCard extends StatelessWidget {
  const ScreenCard({super.key, required this.title, required this.child});

  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 600,
          width: 360,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipPath(
            clipper: ScreenCardClipper(),
            child: Container(
              color: AppColor.yellow,
            ),
          ),
        ),
        Positioned(
          top: 12,
          left: 28,
          right: 28,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/nike.png',
                width: 50,
              ),
              const SizedBox(
                height: 12,
              ),
              title,
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 500,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    scrollbars: false,
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
