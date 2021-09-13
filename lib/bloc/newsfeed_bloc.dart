import 'package:bloc/bloc.dart';
import 'package:facebook/bloc/newsfeed_events.dart';
import 'package:facebook/bloc/newsfeed_states.dart';
import 'package:facebook/data/Repository.dart';

class NewsFeedBloc extends Bloc<NewsfeedEvents, NewsFeedStates> {
  Repository repo;
  NewsFeedBloc(initialState, this.repo) : super(initialState);

  @override
  Stream<NewsFeedStates> mapEventToState(NewsfeedEvents event) async* {
    if (event is DoFetchEvent) {
      yield LoadingState();
      try {
        var users = await repo.fetchOnlineUsers();
        var posts = await repo.fetchPosts();
        var stories = await repo.fetchStories();
        var currentUser = await repo.fetchCurrentUser();
        yield FetchSuccess(
          users: users,
          posts: posts,
          stories: stories,
          currentUser: currentUser,
        );
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}
