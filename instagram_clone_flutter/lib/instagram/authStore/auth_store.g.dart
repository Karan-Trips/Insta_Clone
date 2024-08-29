// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainStore on _MainScreenStore, Store {
  late final _$selectedIndexAtom =
      Atom(name: '_MainScreenStore.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$imageFileAtom =
      Atom(name: '_MainScreenStore.imageFile', context: context);

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$commentsAtom =
      Atom(name: '_MainScreenStore.comments', context: context);

  @override
  List<Comment> get comments {
    _$commentsAtom.reportRead();
    return super.comments;
  }

  @override
  set comments(List<Comment> value) {
    _$commentsAtom.reportWrite(value, super.comments, () {
      super.comments = value;
    });
  }

  late final _$repliesAtom =
      Atom(name: '_MainScreenStore.replies', context: context);

  @override
  Map<Comment, List<Comment>> get replies {
    _$repliesAtom.reportRead();
    return super.replies;
  }

  @override
  set replies(Map<Comment, List<Comment>> value) {
    _$repliesAtom.reportWrite(value, super.replies, () {
      super.replies = value;
    });
  }

  late final _$selectedCommentAtom =
      Atom(name: '_MainScreenStore.selectedComment', context: context);

  @override
  Comment? get selectedComment {
    _$selectedCommentAtom.reportRead();
    return super.selectedComment;
  }

  @override
  set selectedComment(Comment? value) {
    _$selectedCommentAtom.reportWrite(value, super.selectedComment, () {
      super.selectedComment = value;
    });
  }

  late final _$isLikedAtom =
      Atom(name: '_MainScreenStore.isLiked', context: context);

  @override
  bool get isLiked {
    _$isLikedAtom.reportRead();
    return super.isLiked;
  }

  @override
  set isLiked(bool value) {
    _$isLikedAtom.reportWrite(value, super.isLiked, () {
      super.isLiked = value;
    });
  }

  late final _$isSavedAtom =
      Atom(name: '_MainScreenStore.isSaved', context: context);

  @override
  bool get isSaved {
    _$isSavedAtom.reportRead();
    return super.isSaved;
  }

  @override
  set isSaved(bool value) {
    _$isSavedAtom.reportWrite(value, super.isSaved, () {
      super.isSaved = value;
    });
  }

  late final _$pickImageAsyncAction =
      AsyncAction('_MainScreenStore.pickImage', context: context);

  @override
  Future<void> pickImage(String source) {
    return _$pickImageAsyncAction.run(() => super.pickImage(source));
  }

  late final _$_MainScreenStoreActionController =
      ActionController(name: '_MainScreenStore', context: context);

  @override
  void setSelectedIndex(int index) {
    final _$actionInfo = _$_MainScreenStoreActionController.startAction(
        name: '_MainScreenStore.setSelectedIndex');
    try {
      return super.setSelectedIndex(index);
    } finally {
      _$_MainScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleLike() {
    final _$actionInfo = _$_MainScreenStoreActionController.startAction(
        name: '_MainScreenStore.toggleLike');
    try {
      return super.toggleLike();
    } finally {
      _$_MainScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSave() {
    final _$actionInfo = _$_MainScreenStoreActionController.startAction(
        name: '_MainScreenStore.toggleSave');
    try {
      return super.toggleSave();
    } finally {
      _$_MainScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addReply(Comment? comment, Comment reply) {
    final _$actionInfo = _$_MainScreenStoreActionController.startAction(
        name: '_MainScreenStore.addReply');
    try {
      return super.addReply(comment, reply);
    } finally {
      _$_MainScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectComment(Comment? comment) {
    final _$actionInfo = _$_MainScreenStoreActionController.startAction(
        name: '_MainScreenStore.selectComment');
    try {
      return super.selectComment(comment);
    } finally {
      _$_MainScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSelectedComment() {
    final _$actionInfo = _$_MainScreenStoreActionController.startAction(
        name: '_MainScreenStore.clearSelectedComment');
    try {
      return super.clearSelectedComment();
    } finally {
      _$_MainScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
imageFile: ${imageFile},
comments: ${comments},
replies: ${replies},
selectedComment: ${selectedComment},
isLiked: ${isLiked},
isSaved: ${isSaved}
    ''';
  }
}
