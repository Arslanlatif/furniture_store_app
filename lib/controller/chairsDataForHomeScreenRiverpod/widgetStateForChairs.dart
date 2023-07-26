import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Model/modelClassForChairs.dart';
import 'package:flutter_office_furniture_store_app/controller/chairsDataForHomeScreenRiverpod/statesOfChairs.dart';
import 'package:flutter_office_furniture_store_app/view/detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'chairs_stateNotifierProvider.dart';

class FetchChairsData extends ConsumerWidget {
  const FetchChairsData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(chairsStateNotifierProvider);
        if (state is LoadingStateForChairs) {
          return const LoadingWidgetForChair();
        } else if (state is LoadedStateForChairs) {
          return LoadedWidgetForChair(
            list: state.listForChairModelClass,
          );
        } else {
          return ErrorWidgetForChair(
              error: (state as ErrorStateForChairs).error);
        }
      },
    );
  }
}

class LoadingWidgetForChair extends ConsumerWidget {
  const LoadingWidgetForChair({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(chairsStateNotifierProvider.notifier).getChairsData();

    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ErrorWidgetForChair extends ConsumerWidget {
  const ErrorWidgetForChair({required this.error, super.key});

  final String error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(chairsStateNotifierProvider.notifier).getChairsData();

    return Container(
      color: const Color.fromARGB(255, 255, 0, 0),
      child: const Text('Something went wrong Error!'),
    );
  }
}

class LoadedWidgetForChair extends StatefulWidget {
  const LoadedWidgetForChair({required this.list, super.key});
  final List<ModelClassForChairs> list;

  @override
  State<LoadedWidgetForChair> createState() => _LoadedWidgetState();
}

class _LoadedWidgetState extends State<LoadedWidgetForChair> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height;

    return Container(
      width: width * 0.95,
      height: height * 0.43,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 5 / 2,
              crossAxisSpacing: 4 / 2,
              mainAxisSpacing: 15),
          itemCount: widget.list.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                          id: widget.list[index].id,
                          price: widget.list[index].price,
                          heading: widget.list[index].heading,
                          image: widget.list[index].image,
                          description: widget.list[index].description),
                    ));
              },
              child: Row(
                children: [
                  Hero(
                    tag: widget.list[index].id,
                    child: Container(
                      width: width * 0.45,
                      height: height * 0.18,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                              image: NetworkImage(
                                  widget.list[index].image.toString()),
                              fit: BoxFit.cover),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.4,
                        child: AutoSizeText(
                          widget.list[index].heading.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.4,
                        child: AutoSizeText(
                          widget.list[index].description.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          maxLines: 3,
                          wrapWords: true,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
