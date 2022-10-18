import 'package:flutter/material.dart';
import 'package:pharmacy_app/utils/images.dart';

class homePageSceen extends StatefulWidget {
  const homePageSceen({Key? key}) : super(key: key);

  @override
  State<homePageSceen> createState() => _homePageSceenState();
}

class _homePageSceenState extends State<homePageSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: const EdgeInsets.only(left: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                    width: 90,
                    height: 90,
                    child: Center(child: Image.asset(myImages.logo_image))),
                Positioned(
                  width: 25,
                    height: 40,
                    left: 32,
                    top: 12,
                    child: Image.asset(myImages.chaqmoq_image)),
              ],
            ),
            Text("Medtech", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}
