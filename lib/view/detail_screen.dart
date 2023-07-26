import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/controller/addToCartRiverpod/addToCartStateNotifier.dart';
import 'package:flutter_office_furniture_store_app/controller/addToCartRiverpod/addToCartWidgetsState.dart';
import 'package:flutter_office_furniture_store_app/controller/incrementDecrementRiverPod/incementDecrement.dart';
import 'package:flutter_office_furniture_store_app/view/cart_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage(
      {super.key,
      required this.id,
      required this.heading,
      required this.image,
      required this.description,
      required this.price});

  final String heading;
  final String image;
  final String description;
  final double price;
  final String id;

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height - kToolbarHeight;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.98),
      appBar: AppBar(
        title: Text(widget.heading),
        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
        elevation: 10,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 20,
              child: SizedBox(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: widget.id,
                        child: Container(
                          width: width * 0.9,
                          height: height * 0.46,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              image: DecorationImage(
                                  image: NetworkImage(widget.image.toString()),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(Icons.star),
                        ],
                      ),
                    ],
                  ))),
          Expanded(
              flex: 15,
              child: SizedBox(
                width: width * 0.95,
                child: SizedBox(
                  width: width * 0.95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        widget.heading,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.017,
                      ),
                      AutoSizeText(
                        widget.description,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.035,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const AutoSizeText(
                                'Color :',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Container(
                                width: width * 0.09,
                                height: height * 0.05,
                                decoration: const BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Container(
                                width: width * 0.09,
                                height: height * 0.05,
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: (() {
                                  ref
                                      .read(incremDecremnetProvider.notifier)
                                      .deccrement();
                                }),
                                child: Container(
                                  width: width * 0.1,
                                  height: height * 0.05,
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 197, 196, 196),
                                            offset: Offset(0, 1.3)),
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 197, 196, 196),
                                            offset: Offset(0.4, 0)),
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 197, 196, 196),
                                            offset: Offset(-0.4, 0)),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const Center(
                                    child: AutoSizeText(
                                      '-',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.017,
                              ),
                              AutoSizeText(
                                ref
                                    .watch(incremDecremnetProvider)
                                    .counter
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.017,
                              ),
                              InkWell(
                                onTap: (() {
                                  ref
                                      .read(incremDecremnetProvider.notifier)
                                      .increment();
                                }),
                                child: Container(
                                  width: width * 0.1,
                                  height: height * 0.05,
                                  decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 197, 196, 196),
                                            offset: Offset(0, 1.3)),
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 197, 196, 196),
                                            offset: Offset(0.4, 0)),
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 197, 196, 196),
                                            offset: Offset(-0.4, 0)),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: const Center(
                                    child: AutoSizeText(
                                      '+',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Price',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              AutoSizeText(
                                widget.price.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          //  !
                          InkWell(
                              onTap: () {
                                ref
                                    .watch(addToCartStateProvider.notifier)
                                    .addToCart(
                                        heading: widget.heading,
                                        id: widget.id,
                                        image: widget.image,
                                        quantity: ref
                                            .watch(incremDecremnetProvider)
                                            .counter,
                                        price: widget.price,
                                        description: widget.description);

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const CartScreen()));
                              },
                              child: const InsertCartData())
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
