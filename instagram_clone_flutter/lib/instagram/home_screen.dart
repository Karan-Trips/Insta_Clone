import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice_widgets/genrated/assets/assets.dart';
import 'package:practice_widgets/instagram/model/model_post.dart';
import 'package:practice_widgets/widgets/post_cart.dart';
import 'package:practice_widgets/widgets/screen_utils.dart';
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
            height: 120.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _stories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    if (index == 0)
                      Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 80.h,
                                width: 80.w,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  'https://cdn.pixabay.com/photo/2018/07/29/23/05/woman-3571298_960_720.jpg')),
                                          shape: BoxShape.circle),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.blue,
                                              shape: BoxShape.circle),
                                          child: Icon(
                                            Icons.add,
                                            size: 20.w,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ).wrapPaddingTop(50.h),
                                  ],
                                ),
                              ).wrapPaddingAll(8.w),
                              Text(
                                'Your Story',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ],
                      ).wrapPaddingRight(10.w),
                    StoryWidget(
                      username: _stories[index],
                    ),
                  ],
                ).wrapPaddingLeft(16.w);
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
