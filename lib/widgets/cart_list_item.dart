import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_mobile_intern_assignment/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: 120,
                height: 100,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: AppColor.gray,
                        blurRadius: 12,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -32,
                right: -18,
                child: Transform.rotate(
                  angle: -math.pi / 7.5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      top: 36,
                      bottom: 24,
                    ),
                    child: Image.network(
                      'https://s3-us-west-2.amazonaws.com/s.cdpn.io/1315882/odyssey-react-flyknit-2-mens-running-shoe-T3VG7N-removebg-preview.png',
                      fit: BoxFit.cover,
                      width: 120,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Nike Air Max 270',
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '\$200',
                  style: GoogleFonts.rubik(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: IconButton(
                            onPressed: () {},
                            style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFFEEEEEE),
                            ),
                            icon: Image.asset(
                              'assets/images/minus.png',
                              width: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('1'),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: IconButton(
                            onPressed: () {},
                            style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFFEEEEEE),
                            ),
                            icon: Image.asset(
                              'assets/images/plus.png',
                              width: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        print('trash');
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.yellow,
                        ),
                        child: Image.asset(
                          'assets/images/trash.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
