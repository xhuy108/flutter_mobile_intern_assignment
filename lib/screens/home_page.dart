import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_mobile_intern_assignment/config/app_color.dart';
import 'package:flutter_mobile_intern_assignment/screens/cart_page.dart';
import 'package:flutter_mobile_intern_assignment/screens/product_page.dart';
import 'package:flutter_mobile_intern_assignment/widgets/background_clipper.dart';
import 'package:flutter_mobile_intern_assignment/widgets/screen_card.dart';
import 'package:flutter_mobile_intern_assignment/cubit/store_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<StoreCubit>().loadProducts();
    context.read<StoreCubit>().loadCart();
  }

  @override
  Widget build(BuildContext context) {
    final cartTotalPrice = context.watch<StoreCubit>().state.cartTotalPrice;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColor.white,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: AppColor.yellow,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScreenCard(
                    title: Text(
                      'Our Products',
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    child: const ProductPage(),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  ScreenCard(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your cart',
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '\$${cartTotalPrice.toStringAsFixed(2)}',
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    child: const CartPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
