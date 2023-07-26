import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Model/modelClassForAddToCart.dart';
import 'package:flutter_office_furniture_store_app/controller/fetchToCart/fetchToCartStateNotifier.dart';
import 'package:flutter_office_furniture_store_app/controller/fetchToCart/fetchToCartStates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../incrementDecrementRiverPod/incementDecrement.dart';

List<ModelClassForAddToCart> list2 = [];

class FetchCartData extends ConsumerWidget {
  const FetchCartData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(fetchStateProvider);
        if (state is FetchLoadingState) {
          return const FetchLoadingWidget();
        } else if (state is FetchLoadedState) {
          list2 = state.list;
          return FetchLoadedWidget(
            list: state.list,
          );
        } else {
          return FetchErrorWidget(
              errorMessage: (state as FetchErrorState).errorMessage);
        }
      },
    );
  }
}

class FetchLoadingWidget extends ConsumerWidget {
  const FetchLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(fetchStateProvider.notifier).fetchCartData();
    return const Center(child: CircularProgressIndicator());
  }
}

class FetchLoadedWidget extends ConsumerStatefulWidget {
  const FetchLoadedWidget({required this.list, super.key});
  final List<ModelClassForAddToCart> list;

  @override
  ConsumerState<FetchLoadedWidget> createState() => _FetchLoadedWidgetState();
}

class _FetchLoadedWidgetState extends ConsumerState<FetchLoadedWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height;
    final cleintHeight = height ;

    return Expanded(
        flex: 9,
        child: SizedBox(
            width: width,
            child: Column(
              children: [
                SizedBox(
                  width: width * 0.9,
                  height: cleintHeight * 0.66,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 5 / 2,
                              crossAxisSpacing: 4 / 2,
                              mainAxisSpacing: 30),
                      itemCount: widget.list.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Row(
                          children: [
                            Container(
                              width: width * 0.37,
                              height: cleintHeight * 0.18,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.list[index].image),
                                      fit: BoxFit.cover),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            SizedBox(
                              width: width * 0.35,
                              height: cleintHeight * 0.2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AutoSizeText(
                                    widget.list[index].heading,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  AutoSizeText(
                                    widget.list[index].price.toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const AutoSizeText(
                                        'Color : ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Container(
                                        width: width * 0.08,
                                        height: cleintHeight * 0.05,
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 161, 126, 126),
                                            shape: BoxShape.circle),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.14,
                              height: cleintHeight * 0.2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(
                                              incremDecremnetProvider.notifier)
                                          .deccrement();
                                    },
                                    child: Container(
                                      width: width * 0.1,
                                      height: cleintHeight * 0.05,
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
                                    height: cleintHeight * 0.007,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.035),
                                    child: AutoSizeText(
                                      widget.list[index].quantity.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: cleintHeight * 0.007,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(
                                              incremDecremnetProvider.notifier)
                                          .increment();
                                    },
                                    child: Container(
                                      width: width * 0.1,
                                      height: cleintHeight * 0.05,
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
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ],
            )));
  }
}

class FetchErrorWidget extends StatelessWidget {
  final String errorMessage;

  const FetchErrorWidget({required this.errorMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 0, 0),
      child: Center(child: Text(errorMessage)),
    );
  }
}
