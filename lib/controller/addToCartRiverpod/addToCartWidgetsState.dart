import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/controller/addToCartRiverpod/addToCartStateNotifier.dart';
import 'package:flutter_office_furniture_store_app/controller/addToCartRiverpod/addToCartStates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InsertCartData extends ConsumerWidget {
  const InsertCartData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        var state = ref.watch(addToCartStateProvider);
        if (state is AddToCartLoadingState) {
          return const AddToCartLoadingWidget();
        } else if (state is AddToCartLoadedState) {
          return const AddToCartLoadedWidget();
        } else {
          return AddToCartErrorWidget(
              errorMessage: (state as AddToCartErrorState).errorMessage);
        }
      },
    );
  }
}

class AddToCartLoadingWidget extends ConsumerWidget {
  const AddToCartLoadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(addToCartStateProvider.notifier).addToCart();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class AddToCartLoadedWidget extends ConsumerStatefulWidget {
  const AddToCartLoadedWidget({super.key});

  @override
  ConsumerState<AddToCartLoadedWidget> createState() =>
      _AddToCartLoadedWidgetState();
}

class _AddToCartLoadedWidgetState extends ConsumerState<AddToCartLoadedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.38,
      height: MediaQuery.sizeOf(context).height * 0.055,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: const Center(
        child: AutoSizeText(
          'Add to cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class AddToCartErrorWidget extends StatelessWidget {
  final String errorMessage;

  const AddToCartErrorWidget({required this.errorMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 0, 0),
      child: Center(child: Text(errorMessage)),
    );
  }
}
