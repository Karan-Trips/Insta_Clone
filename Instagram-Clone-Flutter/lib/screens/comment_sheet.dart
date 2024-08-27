import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:practice_widgets/genrated/assets/assets.dart';
import 'package:practice_widgets/instagram/authStore/auth_store.dart';
import 'package:practice_widgets/screens/comment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:practice_widgets/widgets/screen_utils.dart';

class CommentSheet extends StatefulWidget {
  const CommentSheet({super.key});

  @override
  _CommentSheetState createState() => _CommentSheetState();
}

class _CommentSheetState extends State<CommentSheet> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _handleReply(String text) {
    if (text.isNotEmpty) {
      final newReply = Comment(
        avatar: Assets.assetsImg3,
        userName: 'you',
        content: text,
      );
      mainScreen.addReply(mainScreen.selectedComment, newReply);
      _textController.clear();
      mainScreen.clearSelectedComment();
    }
  }

  void _focusOnTextField(Comment? comment) {
    mainScreen.selectComment(comment);
    FocusScope.of(context).requestFocus(_focusNode);
  }

  Widget _buildCommentContent(Comment data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.userName ?? 'op'),
              SizedBox(height: 4.h),
              Text(
                data.content ?? '',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        DefaultTextStyle(
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: Colors.grey[700],
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Row(
              children: [
                const Text("2d"),
                TextButton(
                  onPressed: () => _focusOnTextField(data),
                  child: const Text('Reply'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Observer(
              builder: (_) => Text(
                "Comment(${mainScreen.comments.length})",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold),
              ).wrapPaddingBottom(15.h),
            ),
            Expanded(
              child: Observer(
                builder: (_) => SingleChildScrollView(
                  reverse: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mainScreen.comments.length,
                    itemBuilder: (context, index) {
                      final comment = mainScreen.comments[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommentTreeWidget<Comment, Comment>(
                            comment,
                            mainScreen.replies[comment] ?? [],
                            treeThemeData: const TreeThemeData(
                                lineColor: Colors.transparent),
                            avatarRoot: (context, data) => PreferredSize(
                              preferredSize: Size.fromRadius(19.r),
                              child: CircleAvatar(
                                radius: 19.r,
                                backgroundImage:
                                    const AssetImage(Assets.assetsImg4),
                              ),
                            ),
                            contentRoot: (context, data) =>
                                _buildCommentContent(data),
                            avatarChild: (context, data) => PreferredSize(
                              preferredSize: Size.fromRadius(19.r),
                              child: CircleAvatar(
                                radius: 19.r,
                                backgroundColor: Colors.grey,
                                backgroundImage:
                                    const AssetImage(Assets.assetsImg3),
                              ),
                            ),
                            contentChild: (context, data) =>
                                _buildCommentContent(data),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Observer(
                    builder: (_) => TextFormField(
                      controller: _textController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(91.r),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(91.r),
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.attach_file_sharp),
                        ),
                        hintText: mainScreen.selectedComment == null
                            ? 'Write a message'
                            : 'Replying to ${mainScreen.selectedComment?.userName ?? ''}',
                        contentPadding: EdgeInsets.only(left: 20.w),
                      ),
                      textInputAction: TextInputAction.send,
                      onFieldSubmitted: _handleReply,
                    ).wrapPaddingLeft(15.w),
                  ),
                ),
                GestureDetector(
                  onTap: () => _handleReply(_textController.text),
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff388DEB)),
                    padding: EdgeInsets.all(9.r),
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ).wrapPaddingLeft(11.w),
              ],
            ).wrapPaddingBottom(10.h),
          ],
        ).wrapPaddingHorizontal(16.w),
      ),
    );
  }
}
