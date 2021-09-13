import 'package:equatable/equatable.dart';
import 'package:facebook/models/post.dart';
import 'package:facebook/models/story.dart';
import 'package:facebook/models/user.dart';

class NewsFeedStates extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class InitialState extends NewsFeedStates {}

class LoadingState extends NewsFeedStates {}

class FetchSuccess extends NewsFeedStates {
  final List<User> users;
  final List<Story> stories;
  final List<Post> posts;
  final User currentUser;
  FetchSuccess({
    required this.currentUser,
    required this.stories,
    required this.posts,
    required this.users,
  });
}

class ErrorState extends NewsFeedStates {
  final String message;
  ErrorState({required this.message});
}
