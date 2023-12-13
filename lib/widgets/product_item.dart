import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:flutter_mobile_intern_assignment/config/app_color.dart';
import 'package:flutter_mobile_intern_assignment/widgets/add_to_cart_button.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: Color(0xFF4D317F),
          child: Transform.rotate(
            angle: -math.pi / 7.5,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 16,
                top: 36,
                bottom: 24,
              ),
              child: Image.network(
                'https://s3-us-west-2.amazonaws.com/s.cdpn.io/1315882/air-zoom-pegasus-36-mens-running-shoe-wide-D24Mcz-removebg-preview.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Nike Air Zoom Pegasus 36',
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'The Nike Air Zoom Pegasus 36 Shield gets updated to conquer wet routes. A water-repellent upper combines with an outsole that helps create grip on wet surfaces, letting you run in confidence despite the weather.',
          style: TextStyle(
            fontSize: 13,
            color: AppColor.gray,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$120',
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            AddToCartButton(
              onPressed: () {
                print('Add to cart');
              },
            ),
          ],
        ),
        const SizedBox(
          height: 48,
        ),
      ],
    );
  }
}
