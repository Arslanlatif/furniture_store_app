import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Model/modelClassForDetailOrder.dart';
import 'package:flutter_office_furniture_store_app/controller/OrderDetailsRiverpod/OrderDetailsStateNotifier.dart';
import 'package:flutter_office_furniture_store_app/controller/OrderDetailsRiverpod/detailsOrderStates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailOrderData extends ConsumerWidget {
  const DetailOrderData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(detailOrderStateProvider);
        if (state is DetailOrderLoadingState) {
          return const DetailOrderLoadingWidget();
        } else if (state is DetailOrderLoadedState) {
          return DetailOrderLoadedWidget(
            list: state.list,
          );
        } else {
          return DetailOrderErrorWidget(
              errorMessage: (state as DetailOrderErrorState).errorMessage);
        }
      },
    );
  }
}

class DetailOrderLoadingWidget extends ConsumerWidget {
  const DetailOrderLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(detailOrderStateProvider.notifier).fetchDetialOrder();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class DetailOrderLoadedWidget extends StatefulWidget {
  const DetailOrderLoadedWidget({super.key, required this.list});
  final List<ModelClassForDetailOrder> list;

  @override
  State<DetailOrderLoadedWidget> createState() =>
      _DetailOrderLoadedWidgetState();
}

class _DetailOrderLoadedWidgetState extends State<DetailOrderLoadedWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height - kTextTabBarHeight;
    double width = MediaQuery.sizeOf(context).width;

    return Consumer(
      builder: (context, ref, child) {
        return ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading:
                  Image.network(fit: BoxFit.cover, widget.list[index].image),
              title: AutoSizeText(widget.list[index].heading),
              subtitle: AutoSizeText(widget.list[index].price.toString()),
              trailing: AutoSizeText(widget.list[index].quantity.toString()),
            );

            // Container(
            //   height: height * 0.6,
            //   width: width * 0.9,
            //   color: Colors.yellow,
            //   child: Column(
            //     children: [
            //       Expanded(
            //           flex: 1,
            //           child: Text("Name: ${widget.list[index].heading}")),
            //       Expanded(
            //           flex: 4,
            //           child: Image.network(
            //               fit: BoxFit.cover, widget.list[index].image)),
            //       Expanded(
            //           flex: 1,
            //           child: Text("Price: ${widget.list[index].price}")),
            //       Expanded(
            //           flex: 1,
            //           child: Text("Number: ${widget.list[index].number}")),
            //       Expanded(
            //           flex: 2,
            //           child: Text("Address: ${widget.list[index].address}")),
            //     ],
            //   ),
            // );
          },
        );
      },
    );
  }
}

class DetailOrderErrorWidget extends StatelessWidget {
  final String errorMessage;

  const DetailOrderErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 0, 0),
      child: Center(child: Text(errorMessage)),
    );
  }
}
