import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:practice_widgets/screens/comment.dart';
import 'package:practice_widgets/utils/image_picker.dart';

part 'auth_store.g.dart';

class MainStore = _MainScreenStore with _$MainStore;

abstract class _MainScreenStore with Store {
  @observable
  int selectedIndex = 0;
  @observable
  File? imageFile;

  @action
  Future<void> pickImage(String source) async {
    final picker = ImagePickerr();
    final pickedFile = await picker.uploadImage('gallery');

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
  }

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }

  @observable
  List<Comment> comments = [
    Comment(
        avatar: 'null',
        userName: 'karan',
        content: 'hello bhai-log sab thik hai na?'),
    Comment(
        avatar: 'null', userName: 'raju kumar', content: 'Tu bata apna ???'),
    Comment(
        avatar: 'null',
        userName: 'op gg',
        content:
            'There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...'),
    Comment(
        avatar: 'null',
        userName: 'kaka',
        content: 'A Dart template generator which helps teams'),
    Comment(
        avatar: 'null',
        userName: 'dino',
        content:
            'A Dart template generator which helps teams generator which helps teams'),
  ];

  @observable
  Map<Comment, List<Comment>> replies = {};

  @observable
  Comment? selectedComment;
  @observable
  bool isLiked = false;

  @observable
  bool isSaved = false;

  @action
  void toggleLike() {
    isLiked = !isLiked;
  }

  @action
  void toggleSave() {
    isSaved = !isSaved;
  }

  @action
  void addReply(Comment? comment, Comment reply) {
    if (comment != null) {
      replies[comment] = (replies[comment] ?? [])..add(reply);
    } else {
      comments.add(reply);
    }
  }

  @action
  void selectComment(Comment? comment) {
    selectedComment = comment;
  }

  @action
  void clearSelectedComment() {
    selectedComment = null;
  }
}

final MainStore mainScreen = MainStore();
