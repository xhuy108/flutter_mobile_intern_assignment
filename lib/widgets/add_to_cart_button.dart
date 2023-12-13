import 'package:flutter/material.dart';
import 'package:flutter_mobile_intern_assignment/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        backgroundColor: AppColor.yellow,
      ),
      onPressed: onPressed,
      child: Text(
        'ADD TO CART',
        style: GoogleFonts.rubik(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: AppColor.black,
        ),
      ),
    );
  }
}
