import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_mobile_intern_assignment/widgets/product_item.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (ctx, index) => ProductItem(),
      ),
    );
  }
}
