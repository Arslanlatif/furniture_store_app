import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/controller/OrderDetailsRiverpod/detailsOrderWidgetsStates.dart';

class OrderDetals extends StatefulWidget {
  const OrderDetals({super.key});

  @override
  State<OrderDetals> createState() => _OrderDetalsState();
}

class _OrderDetalsState extends State<OrderDetals> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 0, 0),
          title: const Text('Orders'),
        ),
        body: const DetailOrderData(),
      ),
    );
  }
}
