import 'package:flutter/material.dart';
import 'package:practice_widgets/genrated/assets/assets.dart';
import 'package:practice_widgets/instagram/model/model_post.dart';
import 'package:practice_widgets/widgets/post_cart.dart';
import 'package:practice_widgets/widgets/story_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _stories = ['My Post', 'Karan', 'Arjun', 'Raju', 'Vijay'];

  final List<Post> posts = [
    Post(
      imageName: Assets.assetsImg3,
      content: 'This is post 1',
      userName: 'Karan_don',
      likes: 10,
      comments: ['Nice post!', 'Love this!'],
    ),
    Post(
      imageName: Assets.assetsImg4,
      content: 'This is post 2',
      userName: 'arjun_5990',
      likes: 5,
      comments: ['Great picture!', 'Awesome!'],
    ),
    Post(
      imageName: Assets.assetsImgBallon,
      content: 'This is post 3',
      userName: 'kaka_2024',
      likes: 20,
      comments: ['So colorful!', 'Amazing!'],
    ),
    Post(
      imageName: Assets.assetsImgCat,
      content: 'This is post 4',
      userName: 'Nigga_2000',
      likes: 15,
      comments: ['Cute cat!', 'So fluffy!'],
    ),
    Post(
      imageName: Assets.assetsImgSun,
      content: 'This is post 5',
      userName: 'raju_baba',
      likes: 8,
      comments: ['Beautiful sunset!', 'Stunning!'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.black,
        title: const SizedBox(
          height: 50,
          width: 120,
          child: Image(image: AssetImage(Assets.assetsImgLogo)),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite_outline_rounded,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 8),
            child: Icon(
              Icons.energy_savings_leaf_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _stories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return StoryWidget(
                  username: _stories[index],
                );
              },
            ),
          ),
          ListView.builder(
            itemCount: posts.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return PostCart(
                post: posts[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
