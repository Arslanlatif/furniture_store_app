import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/controller/chairsDataForHomeScreenRiverpod/widgetStateForChairs.dart';
import 'package:flutter_office_furniture_store_app/controller/deskDataForHomeScreenRiverpod/widgetStateForDesk.dart';
import 'package:flutter_office_furniture_store_app/view/orderDetails.dart';
import 'package:flutter_office_furniture_store_app/view/signIn_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // For SignOut
  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      drawer: Drawer(
        width: width * 0.4,
        elevation: 20,
        backgroundColor: const Color.fromARGB(255, 255, 0, 0).withOpacity(0.3),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderDetals(),
                        ));
                  },
                  child: const Chip(
                      side: BorderSide.none,
                      elevation: 20,
                      shadowColor: Colors.black,
                      backgroundColor: Color.fromARGB(255, 255, 0, 0),
                      label: Text('Your Orders')))),
          Center(
              child: GestureDetector(
                  onTap: () {
                    signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ));
                  },
                  child: const Chip(
                      side: BorderSide.none,
                      elevation: 20,
                      shadowColor: Colors.black,
                      backgroundColor: Color.fromARGB(255, 255, 0, 0),
                      label: Text('SignOut')))),
        ]),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: width * 0.95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      'Hello',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Icon(Icons.dehaze_sharp),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                const AutoSizeText(
                                  'Buy Your favourite desk',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                width: width * 0.95,
                                height: height * 0.07,
                                child: const TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    suffixIcon: Icon(Icons.dehaze_sharp),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(17)),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: (BorderSide(
                                          width: 1.0, color: Colors.blue)),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(17),
                                      ),
                                    ),
                                    labelText: 'Search',
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  width: width * 0.95,
                  child: const FetchDeskData(),
                ),
              ),
              Expanded(
                flex: 8,
                child: SizedBox(
                  width: width * 0.95,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AutoSizeText(
                        'Popular',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      SizedBox(
                        width: width * 0.95,
                        height: height * 0.43,
                        child: const FetchChairsData(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
