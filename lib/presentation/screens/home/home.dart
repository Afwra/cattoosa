import 'dart:io';

import 'package:cattoosa/core/constant/colors.dart';
import 'package:cattoosa/cottoosa/core/constant/colors.dart';
import 'package:cattoosa/presentation/screens/details/details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Mycolor.mainColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: Column(
                                children: [
                                  const Text('Recommended Audio',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 22,
                                      )),
                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                              "assets/images/Cartoon-green-snake-on-transparent-background-PNG.png",
                                              fit: BoxFit.fill),
                                        ),
                                        const SizedBox(width: 10),
                                        const Text('Cobra Snake',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                              "assets/images/Cow_(Fleckvieh_breed)_Oeschinensee_Slaunger_2009-07-07.jpg",
                                              fit: BoxFit.fill),
                                        ),
                                        const SizedBox(width: 10),
                                        const Text('Cow',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                              "assets/images/amur-tiger-01-01.webp",
                                              fit: BoxFit.fill),
                                        ),
                                        const SizedBox(width: 10),
                                        const Text('Tiger',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                              "assets/images/Cartoon-green-snake-on-transparent-background-PNG.png",
                                              fit: BoxFit.fill),
                                        ),
                                        const SizedBox(width: 10),
                                        const Text('Cobra Snake',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 22,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          );
                        },
                      );
                    }),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            const Spacer(),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const DetailsScreen()));
                },
                child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset("assets/images/record.png")),
              ),
            ),
            Text('Record your Voice',
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Container(
                    width: 200,
                    height: 200,
                    child: const Icon(
                      Icons.upload_file,
                      color: Color.fromARGB(255, 13, 127, 131),
                      size: 100,
                    )),
              ),
            ),
            Text('upload your Voice',
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            const Spacer(
              flex: 3,
            )
          ],
        ));
  }
}
