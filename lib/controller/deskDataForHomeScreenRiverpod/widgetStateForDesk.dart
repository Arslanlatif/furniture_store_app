import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Model/modelClassForDesk.dart';
import 'package:flutter_office_furniture_store_app/controller/deskDataForHomeScreenRiverpod/desk_sateNotifierProvider.dart';
import 'package:flutter_office_furniture_store_app/controller/deskDataForHomeScreenRiverpod/statesOfDesk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view/detail_screen.dart';

class FetchDeskData extends ConsumerWidget {
  const FetchDeskData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(deskStateNotifierProvider);
        if (state is LoadingStateForDesk) {
          return const LoadingWidgetForDesk();
        } else if (state is LoadedStateForDesk) {
          return LoadedWidgetForDesk(
            list: state.listForDeskModelClass,
          );
        } else {
          return ErrorWidgetForDesk(error: (state as ErrorStateForDesk).error);
        }
      },
    );
  }
}

class LoadingWidgetForDesk extends ConsumerWidget {
  const LoadingWidgetForDesk({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(deskStateNotifierProvider.notifier).getDeskData();

    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ErrorWidgetForDesk extends StatelessWidget {
  const ErrorWidgetForDesk({required this.error, super.key});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 0, 0),
      child: const Text('Something went wrong Error!'),
    );
  }
}

class LoadedWidgetForDesk extends StatefulWidget {
  final List<ModelClassForDesk> list;

  const LoadedWidgetForDesk({required this.list, super.key});

  @override
  State<LoadedWidgetForDesk> createState() => _LoadedWidgetState();
}

class _LoadedWidgetState extends State<LoadedWidgetForDesk> {
  int index = 0;
  Color focusedColor = const Color.fromARGB(255, 255, 17, 0);
  Color unfocusedColor = Colors.grey;
  late Color color1, color2, color3, color4, color5, color6, color7;

  @override
  void initState() {
    super.initState();
    color1 = focusedColor;
    color2 = unfocusedColor;
    color3 = unfocusedColor;
    color4 = unfocusedColor;
    color5 = unfocusedColor;
    color6 = unfocusedColor;
    color7 = unfocusedColor;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height;

    return Container(
      height: height,
      width: width,
      child: SizedBox(
        width: width * 0.95,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    InkWell(
                      onTap: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  description: widget.list[index].description,
                                  heading: widget.list[index].heading,
                                  image: widget.list[index].image,
                                  price: widget.list[index].price,
                                  id: widget.list[index].id,
                                )));
                      }),
                      child: SizedBox(
                          width: width * 0.95,
                          height: height * 0.175,
                          child: CarouselSlider.builder(
                            itemCount: widget.list.length,
                            itemBuilder: (context, index, realIndex) {
                              return Hero(
                                tag: widget.list[index].id,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      image: DecorationImage(
                                          image: NetworkImage(widget
                                              .list[index].image
                                              .toString()),
                                          fit: BoxFit.cover),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                              );
                            },
                            options: CarouselOptions(
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    this.index = index;
                                    color1 = unfocusedColor;
                                    color2 = unfocusedColor;
                                    color3 = unfocusedColor;
                                    color4 = unfocusedColor;
                                    color5 = unfocusedColor;
                                    color6 = unfocusedColor;
                                    color7 = unfocusedColor;
                                    if (index == 0) {
                                      color1 = focusedColor;
                                    } else if (index == 1) {
                                      color2 = focusedColor;
                                    } else if (index == 2) {
                                      color3 = focusedColor;
                                    } else if (index == 3) {
                                      color4 = focusedColor;
                                    } else if (index == 4) {
                                      color5 = focusedColor;
                                    } else if (index == 5) {
                                      color6 = focusedColor;
                                    } else {
                                      color7 = focusedColor;
                                    }
                                  });
                                },
                                enlargeCenterPage: true,
                                height: 200,
                                reverse: false,
                                enableInfiniteScroll: true),
                          )),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: index == 0 ? width * 0.06 : width * 0.045,
                          height: index == 0 ? height * 0.017 : height * 0.01,
                          decoration: BoxDecoration(
                              color: color1, shape: BoxShape.circle),
                        ),
                        Container(
                          width: index == 1 ? width * 0.06 : width * 0.045,
                          height: index == 1 ? height * 0.017 : height * 0.01,
                          decoration: BoxDecoration(
                              color: color2, shape: BoxShape.circle),
                        ),
                        Container(
                          width: index == 2 ? width * 0.06 : width * 0.045,
                          height: index == 2 ? height * 0.017 : height * 0.01,
                          decoration: BoxDecoration(
                              color: color3, shape: BoxShape.circle),
                        ),
                        Container(
                          width: index == 3 ? width * 0.06 : width * 0.045,
                          height: index == 3 ? height * 0.017 : height * 0.01,
                          decoration: BoxDecoration(
                              color: color4, shape: BoxShape.circle),
                        ),
                        Container(
                          width: index == 4 ? width * 0.06 : width * 0.045,
                          height: index == 4 ? height * 0.017 : height * 0.01,
                          decoration: BoxDecoration(
                              color: color5, shape: BoxShape.circle),
                        ),
                        Container(
                          width: index == 5 ? width * 0.06 : width * 0.045,
                          height: index == 5 ? height * 0.017 : height * 0.01,
                          decoration: BoxDecoration(
                              color: color6, shape: BoxShape.circle),
                        ),
                        Container(
                          width: index == 6 ? width * 0.06 : width * 0.045,
                          height: index == 6 ? height * 0.017 : height * 0.01,
                          decoration: BoxDecoration(
                              color: color7, shape: BoxShape.circle),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
