import 'package:flutter/material.dart';

import 'package:flutter_mobile_intern_assignment/config/app_color.dart';
import 'package:flutter_mobile_intern_assignment/screens/cart_page.dart';
import 'package:flutter_mobile_intern_assignment/screens/product_page.dart';
import 'package:flutter_mobile_intern_assignment/widgets/background_clipper.dart';
import 'package:flutter_mobile_intern_assignment/widgets/screen_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ScreenCard(
                    title: 'Our products',
                    child: ProductPage(),
                  ),
                  ScreenCard(
                    title: 'Your cart',
                    child: CartPage(),
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
