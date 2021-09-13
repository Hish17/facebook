import 'package:facebook/data/data.dart';
import 'package:facebook/models/post.dart';
import 'package:facebook/models/story.dart';
import 'package:facebook/models/user.dart';

class Repository {
  Future<List<User>> fetchOnlineUsers() async {
    // Simulate network delay
    return await Future.delayed(
      Duration(seconds: 2),
      () {
        return onlineUsers;
      },
    );
  }

  Future<List<Post>> fetchPosts() async {
    // Simulate network delay
    return await Future.delayed(
      Duration(seconds: 2),
      () {
        return posts;
      },
    );
  }

  Future<List<Story>> fetchStories() async {
    // Simulate network delay
    return await Future.delayed(
      Duration(seconds: 2),
      () {
        return stories;
      },
    );
  }

  Future<User> fetchCurrentUser() async {
    // Simulate network delay
    return await Future.delayed(
      Duration(seconds: 2),
      () {
        return currentUser;
      },
    );
  }
}
