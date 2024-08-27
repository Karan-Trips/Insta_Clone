import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(color: Colors.red),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Ferrari'),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: 350,
                              fit: BoxFit.cover,
                              image: const NetworkImage(
                                  'https://c7.alamy.com/comp/DXEMJ8/ferrari-logo-flag-symbol-icon-emblem-DXEMJ8.jpg')),
                        )
                      ]),
                ),
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'dhhhddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
                      )
                    ],
                  ),
                )
                // Container(
                //   height: 400,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(color: Colors.red),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
