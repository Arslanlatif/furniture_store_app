import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  void initState() {
    super.initState();
    color;
  }

  Color color = Colors.white.withOpacity(0.4);
  void changeColor() {
    Color changeColors = Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    final height = size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/firstpage.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: SizedBox(
                    width: width,
                    child: const Column())),
            Expanded(
                flex: 3,
                child: SizedBox(
                    width: width,
                    child: const Column())),
            Expanded(
                flex: 4,
                child: SizedBox(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.075),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    'Furnish',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  AutoSizeText(
                                    'Standing',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  AutoSizeText(
                                    'Desk',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: width,
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.075),
                                        child: SizedBox(
                                          width: width,
                                          child: const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                  'create a sustanable work space with',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15)),
                                              AutoSizeText(
                                                  '100% natural bamboo',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15))
                                            ],
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: width,
                                            height: height * 0.12,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  bottom: height * 0.03,
                                                  left: width * 0.22,
                                                  child: Container(
                                                    width: width * 0.65,
                                                    height: height * 0.07,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    30))),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: width *
                                                                    0.13),
                                                        child: const AutoSizeText(
                                                            'Get Started',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: height * 0.0355,
                                                  right: width * 0.1,
                                                  child: InkWell(
                                                    onTap: (() {
                                                      setState(() {
                                                        color = Colors.red;
                                                      });

                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const HomeScreen()));
                                                    }),
                                                    child: Container(
                                                      width: width * 0.2,
                                                      height: height * 0.06,
                                                      decoration: BoxDecoration(
                                                        color: color,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Icon(
                                                        Icons.arrow_back,
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ))
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
