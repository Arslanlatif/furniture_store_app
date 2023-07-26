import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/controller/orderRiverpod/orderStateNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'orderStates.dart';

class OrderData extends ConsumerWidget {
  const OrderData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(orderStateProvider);
        if (state is OrderLoadingState) {
          return const OrderLoadingWidget();
        } else if (state is OrderLoadedState) {
          return const OrderLoadedWidget();
        } else {
          return OrderErrorWidget(
              errorMessage: (state as OrderErrorState).errorMessage);
        }
      },
    );
  }
}

class OrderLoadingWidget extends ConsumerWidget {
  const OrderLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(orderStateProvider.notifier).orderSave();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class OrderLoadedWidget extends StatefulWidget {
  const OrderLoadedWidget({super.key});

  @override
  State<OrderLoadedWidget> createState() => _OrderLoadedWidgetState();
}

class _OrderLoadedWidgetState extends State<OrderLoadedWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height - kTextTabBarHeight;
    double width = MediaQuery.sizeOf(context).width;

    return Chip(
      padding: EdgeInsets.only(
          top: height * 0.01,
          bottom: height * 0.01,
          left: width * 0.1,
          right: width * 0.1),
      side: BorderSide.none,
      backgroundColor: Colors.redAccent,
      shadowColor: Colors.black,
      elevation: 30,
      label: Text('Order',
          style: TextStyle(color: Colors.black, fontSize: width * 0.06)),
    );
  }
}

class OrderErrorWidget extends StatelessWidget {
  final String errorMessage;

  const OrderErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 0, 0),
      child: Center(child: Text(errorMessage)),
    );
  }
}
