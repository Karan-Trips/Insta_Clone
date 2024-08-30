import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_widgets/firebase_services/firestore.dart';
import 'package:practice_widgets/firebase_services/model/user_model.dart';
import 'package:practice_widgets/genrated/assets/assets.dart';
import 'package:practice_widgets/instagram/login_screen.dart';
import 'package:practice_widgets/widgets/edit_profile_button.dart';
import 'package:practice_widgets/widgets/screen_utils.dart';
import 'package:practice_widgets/widgets/story_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.id});
  final String id;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List _stories = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> logout(BuildContext context) async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'isLoggedIn');
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void _openImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              height: 280.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            backgroundColor: Colors.black,
            title: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    backgroundColor: Colors.blueGrey.shade900,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Column(children: [
                                CheckboxListTile(
                                  value: true,
                                  onChanged: (val) {},
                                  activeColor: Colors.blue,
                                  checkboxShape: const StadiumBorder(),
                                  title: Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage:
                                            AssetImage(Assets.assetsImgCat),
                                      ).wrapPaddingRight(10.w),
                                      const Text(
                                        "Karan_5299",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ).wrapPaddingVertical(10),
                                ListTile(
                                        onTap: () {},
                                        leading: Container(
                                            height: 40.h,
                                            width: 40.w,
                                            decoration: const BoxDecoration(
                                                color: Colors.black38,
                                                shape: BoxShape.circle),
                                            child: const Icon(Icons.add,
                                                color: Colors.white)),
                                        title: const Text(
                                            "Add Instagram Account",
                                            style:
                                                TextStyle(color: Colors.white)))
                                    .wrapPaddingVertical(10)
                              ])).wrapPaddingSymmetric(horizontal: 10),
                          Container(
                                  height: 32.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.w, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(50.r),
                                      color: Colors.transparent),
                                  child: const Center(
                                      child: Text("Go to Account Center",
                                          style:
                                              TextStyle(color: Colors.white))))
                              .wrapPaddingSymmetric(
                                  horizontal: 10.w, vertical: 10.h)
                        ],
                      );
                    });
              },
              child: const Row(
                children: [
                  Text('Karan_5299',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  Icon(Icons.arrow_drop_down_outlined, color: Colors.white),
                ],
              ),
            ),
            actions: [
              Row(
                children: [
                  const Icon(Icons.add_box_outlined, size: 30)
                      .wrapPaddingRight(15),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.table_rows_rounded, size: 30)
                        .wrapPaddingRight(15.w),
                  ),
                  GestureDetector(
                      onTap: () {
                        logout(context);
                      },
                      child: const Icon(Icons.logout, size: 30)
                          .wrapPaddingRight(5.w)),
                ],
              ).wrapPaddingRight(20.w)
            ],
          ),
          backgroundColor: Colors.black,
          body: FutureBuilder(
              future: Firebase_Firestor().getUser(UID: widget.id),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Skeletonizer(
                    enabled: true,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
                      child: CircleAvatar(
                        radius: 40.r,
                        backgroundColor: Colors.grey.shade300,
                      ),
                    ),
                  );
                }
                Usermodel snap = snapshot.data as Usermodel;
                // print('${snapshot.data}');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
                          child: GestureDetector(
                            onTap: () {
                              _openImageDialog(context, snap.profile);
                            },
                            child: CircleAvatar(
                                radius: 40.r,
                                backgroundImage: NetworkImage(snap.profile)),
                          ),
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //////////////////////////////////////////////////////////////////////
                    Row(
                      children: [
                        Text(
                          snap.username,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ).wrapPaddingHorizontal(15.w),
                    SizedBox(height: 8.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          snap.bio,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
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
                    const Editprofilebuttons()
                        .wrapPaddingSymmetric(horizontal: 16.w, vertical: 10),

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
                );
              }),
        ));
  }
}
