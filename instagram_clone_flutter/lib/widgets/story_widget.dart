import 'package:flutter/material.dart';
import 'package:practice_widgets/widgets/insta_story.dart';

class StoryWidget extends StatelessWidget {
  final String username;

  const StoryWidget({super.key, required this.username});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MoreStories(),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2018/07/29/23/05/woman-3571298_960_720.jpg',
                      ),
                    ),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.pink, width: 3),
                  ),
                ),
              ],
            ),
          ),
          Text(
            username,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}
