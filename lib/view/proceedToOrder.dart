import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_office_furniture_store_app/controller/googleMaps/googleMaps.dart';
import 'package:flutter_office_furniture_store_app/controller/orderRiverpod/orderStateNotifier.dart';
import 'package:flutter_office_furniture_store_app/controller/orderRiverpod/orderWidgetState.dart';
import 'package:flutter_office_furniture_store_app/view/home_screen.dart';
import 'package:flutter_office_furniture_store_app/view/widgets/textFormField.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';

import '../Model/modelClassForAddToCart.dart';
import '../controller/validator/validatorMixin.dart';

class ProceedToOrder extends ConsumerStatefulWidget {
  const ProceedToOrder({required this.list, super.key});

  final List<ModelClassForAddToCart> list;
  @override
  ConsumerState<ProceedToOrder> createState() => _ProceedToOrderState();
}

class _ProceedToOrderState extends ConsumerState<ProceedToOrder>
    with FormValidationMixin {
  TextEditingController addressTEC = TextEditingController();
  TextEditingController numberTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height - kTextTabBarHeight;
    double width = MediaQuery.sizeOf(context).width;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Color.fromARGB(255, 255, 0, 0)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 17, 0),
          title: const Text('Proceed'),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(255, 233, 76, 76).withOpacity(0.6),
            height: height,
            width: width,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.1),
                  child: Chip(
                    side: BorderSide.none,
                    backgroundColor: Colors.redAccent,
                    shadowColor: Colors.black,
                    elevation: 30,
                    label: Text('Enter Details to Order',
                        style: TextStyle(
                            color: Colors.black, fontSize: width * 0.06)),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.17, right: width * 0.2),
                  child: const Text(
                    'Click the icon to get current location',
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.010),
                  child: textFormField(
                    isPassword: false,
                    isEmail: false,
                    controller: addressTEC,
                    context: context,
                    hintText: 'Address',
                    icon: Icons.home,
                    suffixIcon: IconButton(
                        onPressed: () async {
                          Placemark placemark = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GoogleMaps(),
                              ));
                          addressTEC.text =
                              "${placemark.street}, ${placemark.postalCode}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
                          setState(() {});
                        },
                        icon: const Icon(Icons.location_on)),
                    validator: (value) => emptyValidation(value),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: height * 0.2, top: height * 0.05),
                  child: textFormField(
                    isPassword: false,
                    isEmail: false,
                    controller: numberTEC,
                    context: context,
                    hintText: 'cell phone no',
                    icon: Icons.phone,
                    validator: (value) => phoneNumberValidation(value),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      ref.watch(orderStateProvider.notifier).orderSave(
                        
                          number: numberTEC.text, address: addressTEC.text);

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.redAccent,
                          elevation: 20,
                          
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(20))),
                          content: Text('Your Order has been done')));

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    },
                    child: const OrderData())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
