import 'package:flutter/material.dart';
import 'package:practice_widgets/instagram/model/model_post.dart';
import 'package:practice_widgets/widgets/circle_story.dart';

import '../screens/comment_sheet.dart';

class PostCart extends StatefulWidget {
  final Post post;
  const PostCart({super.key, required this.post});

  @override
  // ignore: library_private_types_in_public_api
  _PostCartState createState() => _PostCartState();
}

class _PostCartState extends State<PostCart> {
  bool isLiked = false;
  bool isSaved = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void toggleSave() {
    setState(() {
      isSaved = !isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleStory(),
                  const SizedBox(width: 8),
                  Text(
                    widget.post.userName,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
              const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ],
          ),
        ),
        ///////////////////////////////////////////////////////////////////////////
        Image.asset(
          widget.post.imageName,
          fit: BoxFit.cover,
        ),
        ///////////////////////////////////////////////////////////////////////////
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_outline_rounded,
                      color: isLiked ? Colors.red : Colors.white,
                      size: 30,
                    ),
                    onPressed: toggleLike,
                  ),
                  const SizedBox(width: 13),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        isScrollControlled: true,
                        showDragHandle: true,
                        builder: (_) {
                          return const CommentSheet();
                        },
                      );
                    },
                    child: const Icon(
                      Icons.chat_bubble_outline_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  const SizedBox(width: 13),
                  const Icon(
                    Icons.near_me_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: toggleSave,
              ),
            ],
          ),
        ),
        ///////////////////////////////////////////////////////////////////////////
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            widget.post.likes.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 14.0, top: 5.0),
          child: Row(
            children: [
              Text(
                'username123',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 3),
              Expanded(
                child: Text(
                  'hello this is my first post ',
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isDismissible: true,
              isScrollControlled: true,
              showDragHandle: true,
              builder: (_) {
                return const CommentSheet();
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 5.0),
            child: Text(
              'view 54 comments',
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 5.0),
          child: Text(
            '2 days ago',
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ),
      ],
    );
  }
}
