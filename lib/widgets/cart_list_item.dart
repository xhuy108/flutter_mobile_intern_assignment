import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:flutter_mobile_intern_assignment/config/app_color.dart';
import 'package:flutter_mobile_intern_assignment/cubit/store_cubit.dart';
import 'package:flutter_mobile_intern_assignment/models/cart_item.dart';
import 'package:google_fonts/google_fonts.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                width: 120,
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(
                      int.parse(
                        item.product.color.replaceAll('#', '0xff'),
                      ),
                    ),
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
                      item.product.image,
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
                  item.product.name,
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '\$${item.product.price}',
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
                            onPressed: () {
                              if (item.quantity == 1) {
                                context.read<StoreCubit>().removeFromCart(item);
                              } else {
                                context
                                    .read<StoreCubit>()
                                    .decreaseCartItemQuantity(item);
                              }
                            },
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
                        Text(
                          item.quantity.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<StoreCubit>()
                                  .increaseCartItemQuantity(item);
                            },
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
                        context.read<StoreCubit>().removeFromCart(item);
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
