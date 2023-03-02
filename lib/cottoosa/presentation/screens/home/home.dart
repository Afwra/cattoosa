import 'package:cattoosa/core/constant/colors.dart';
import 'package:cattoosa/cottoosa/presentation/screens/details/details.dart';
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
            Center(
              child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/images/upload.png")),
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
