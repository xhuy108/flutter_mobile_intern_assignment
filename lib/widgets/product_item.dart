import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_intern_assignment/cubit/store_cubit.dart';
import 'package:flutter_mobile_intern_assignment/models/cart_item.dart';
import 'package:flutter_mobile_intern_assignment/models/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:flutter_mobile_intern_assignment/config/app_color.dart';
import 'package:flutter_mobile_intern_assignment/widgets/add_to_cart_button.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final isAddedToCart = context
            .watch<StoreCubit>()
            .state
            .cart
            .where(
              (element) => element.product.id == widget.product.id,
            )
            .firstOrNull !=
        null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: Color(
            int.parse(
              widget.product.color.replaceAll('#', '0xff'),
            ),
          ),
          child: Transform.rotate(
            angle: -math.pi / 7.5,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 16,
                top: 36,
                bottom: 24,
              ),
              child: Image.network(
                widget.product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          widget.product.name,
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          widget.product.description,
          style: const TextStyle(
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
              '\$${widget.product.price}',
              style: GoogleFonts.rubik(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            AddToCartButton(
              content: isAddedToCart
                  ? Image.asset(
                      'assets/images/check.png',
                      width: 24,
                    )
                  : Text(
                      'ADD TO CART',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppColor.black,
                      ),
                    ),
              onPressed: isAddedToCart
                  ? () {}
                  : () {
                      context.read<StoreCubit>().addToCart(
                            CartItem(
                              product: widget.product,
                              quantity: 1,
                            ),
                          );
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
