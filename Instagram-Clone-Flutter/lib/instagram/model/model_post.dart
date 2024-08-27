class Post {
  final String imageName;
  final String content;
  final String userName;
  int likes;
  List<String> comments;

  Post({
    required this.imageName,
    required this.content,
    required this.userName,
    this.likes = 0,
    List<String>? comments,
  }) : comments = comments ?? [];
}
