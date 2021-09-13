import 'user.dart';

class Post {
  final User user;
  final String caption;
  final String timeAgo;
  final int likes;
  final int comments;
  final int shares;
  final List<String>? images;

  const Post({
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.images,
  });
}
