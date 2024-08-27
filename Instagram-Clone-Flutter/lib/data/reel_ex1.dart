import 'package:flutter/material.dart';
import 'package:practice_widgets/widgets/circle_story.dart';

class ReelEx1 extends StatelessWidget {
  const ReelEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'Reels',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: const Column(
        children: [
          Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  'reel 1',
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Expanded(
              child: Center(
                  child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          '122k',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
              //////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.chat_bubble_outline_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          '563',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
              ///////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 3),
                        child: SizedBox(
                            height: 55, width: 55, child: CircleStory()),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'username123',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.near_me_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              /////////////////////////////////
            ],
          ))),
        ],
      ),
    );
  }
}
