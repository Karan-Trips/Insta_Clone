import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircleStory extends StatelessWidget {
  const CircleStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 35,
          width: 35,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2018/07/29/23/05/woman-3571298_960_720.jpg'))),
        ));
  }
}
