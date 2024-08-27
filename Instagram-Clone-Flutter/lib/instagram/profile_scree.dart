import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_widgets/instagram/login_screen.dart';
import 'package:practice_widgets/widgets/screen_utils.dart';
import 'package:practice_widgets/widgets/story_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  final List _stories = [];

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: const Text(
              'usernmae123',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add_box_outlined,
                      size: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.table_rows_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
                    child: CircleAvatar(
                        radius: 40.r,
                        backgroundImage:
                            const AssetImage('assets/img/cat.jpg')),
                  ),
                  const Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            '10',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text(
                        '130',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 26.0),
                    child: Column(
                      children: [
                        Text(
                          '405',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //////////////////////////////////////////////////////////////////////
              const Row(
                children: [
                  Text(
                    'Daniele Lucca',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ).wrapPaddingHorizontal(15.w),
              SizedBox(height: 8.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'I welcome you to my profile, please do not stalk me.',
                    softWrap: true,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '• June 29, 2002',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '• Jamnagar, India',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '• Software Engineer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ).wrapPaddingSymmetric(horizontal: 16.w),
              //////////////////////////////////////////////////////////
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 32.h,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade700,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                          child: Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 32.h,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade700,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                          child: Text(
                        'Share Profile',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ).wrapPaddingHorizontal(10.w),
                  ),
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Icon(
                        Icons.person_add,
                        color: Colors.white,
                      ),
                    ),
                  ).wrapPaddingHorizontal(5.w),
                ],
              ).wrapPaddingSymmetric(horizontal: 16.w, vertical: 10),

              ///////////////////////////////////////////////////////////////////////

              _stories.isNotEmpty
                  ? SizedBox(
                      height: 120,
                      child: ListView.builder(
                          itemCount: _stories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return StoryWidget(username: _stories[index]);
                          }),
                    )
                  : Row(
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 75.h,
                                width: 75.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1.w, color: Colors.white)),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ).wrapPaddingBottom(5.h),
                            ),
                            Text(
                              "New",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            )
                          ],
                        ),
                      ],
                    ).wrapPaddingLeft(16.w),

              const TabBar(
                  indicatorColor: Colors.white,
                  dividerHeight: 0,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.grid_on_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.video_library_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      icon: FaIcon(
                        FontAwesomeIcons.circleUser,
                        color: Colors.white,
                      ),
                    ),
                  ]),

              const Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 60,
                          ),
                          Text(
                            "No Posts Yet",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Icon(
                            Icons.person_add,
                            color: Colors.white,
                            size: 60,
                          ),
                          Text(
                            "Photos and videos of you",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 60,
                          ),
                          Text(
                            "No Posts Yet",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
