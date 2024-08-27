// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:story_view/story_view.dart';

class MoreStories extends StatefulWidget {
  const MoreStories({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final StoryController storyController = StoryController();
  final TextEditingController _replyController = TextEditingController();
  final FocusNode _replyFocusNode = FocusNode();
  int currentIndex = 0;

  @override
  void dispose() {
    storyController.dispose();
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            StoryView(
              storyItems: [
                StoryItem.text(
                  title:
                      "I guess you'd love to see more of our food. That's great.",
                  backgroundColor: Colors.blue,
                ),
                StoryItem.text(
                  title: "Nice!\n\nTap to continue.",
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(
                    fontFamily: 'Dancing',
                    fontSize: 40,
                  ),
                ),
                StoryItem.pageImage(
                  url:
                      "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
                  caption: const Text(
                    "Still sampling",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  controller: storyController,
                ),
                StoryItem.pageImage(
                  url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                  caption: const Text(
                    "Working with gifs",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  controller: storyController,
                ),
                StoryItem.pageImage(
                  url:
                      "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
                  caption: const Text(
                    "Hello, from the other side",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  controller: storyController,
                ),
              ],
              onStoryShow: (storyItem, index) {
               
              },
              onComplete: () {
                print("Completed a cycle");
              },
              progressPosition: ProgressPosition.top,
              repeat: false,
              indicatorHeight: IndicatorHeight.small,
              onVerticalSwipeComplete: (direction) {
                if (direction == Direction.up) {
                  _replyFocusNode.requestFocus();

                  storyController.pause();
                }
              },
              indicatorOuterPadding: EdgeInsets.all(12.r),
              controller: storyController,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        focusNode: _replyFocusNode,
                        controller: _replyController,
                        decoration: InputDecoration(
                          hintText: 'Write a reply...',
                          hintStyle: const TextStyle(color: Colors.white70),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r),
                              borderSide:
                                  const BorderSide(color: Colors.white70)),
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.white70),
                              borderRadius: BorderRadius.circular(50.r)),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.heart,
                          color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.paperPlane,
                          color: Colors.white),
                      onPressed: () {
                        storyController.play();
                        print('Reply: ${_replyController.text}');
                        _replyController.clear();
                        _replyFocusNode.unfocus();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
