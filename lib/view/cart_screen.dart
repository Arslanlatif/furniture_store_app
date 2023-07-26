import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/view/proceedToOrder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/fetchToCart/fetchToCartWidgetStates.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height;
    final cleintHeight = height - kBottomNavigationBarHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text('CartScreen'),
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const FetchCartData(),
            Expanded(
                flex: 2,
                child: SizedBox(
                    width: width * 0.93,
                    child: Column(
                      children: [
                        SizedBox(
                          height: cleintHeight * 0.08,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AutoSizeText(
                                  'Total price',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                SizedBox(
                                  height: cleintHeight * 0.01,
                                ),
                                const AutoSizeText(
                                  '\$1469.96',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>  ProceedToOrder(list: list2,)));
                              },
                              child: Container(
                                width: width * 0.38,
                                height: cleintHeight * 0.055,
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Center(
                                  child: AutoSizeText(
                                    'Chekout',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
