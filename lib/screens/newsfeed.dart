import 'package:facebook/bloc/newsfeed_bloc.dart';
import 'package:facebook/bloc/newsfeed_events.dart';
import 'package:facebook/bloc/newsfeed_states.dart';
import 'package:facebook/models/post.dart';
import 'package:facebook/widgets/contactsList.dart';
import 'package:facebook/widgets/moreOptions.dart';
import 'package:facebook/widgets/postContainer.dart';
import 'package:facebook/widgets/responsive.dart';

// import 'package:facebook/data/data.dart';
import 'package:facebook/widgets/roomsWidget.dart';
import 'package:facebook/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/widgets/circleButton.dart';
import '/widgets/createPostWidget.dart';

class NewsFeed extends StatefulWidget {
  // const MyNewsFeed({Key? key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();
  late NewsFeedBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<NewsFeedBloc>(context);
    bloc.add(DoFetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    _trackingScrollController.dispose();
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsFeedBloc, NewsFeedStates>(builder: (context, state) {
      if (state is InitialState) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is LoadingState) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is FetchSuccess) {
        return Scaffold(
          backgroundColor:
              Responsive.isMobile(context) ? Colors.grey : Colors.white,
          body: Responsive(
            mobile: CustomScrollView(
              controller: _trackingScrollController,
              slivers: [
                SliverAppBar(
                  brightness: Brightness.light,
                  backgroundColor: Colors.white,
                  title: Text(
                    'facebook',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.2,
                    ),
                  ),
                  centerTitle: false,
                  actions: [
                    CircleButton(
                      icon: Icons.search,
                    ),
                    CircleButton(
                      icon: Icons.message,
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: CreatePostWidget(
                    currentUser: state.currentUser,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  sliver: SliverToBoxAdapter(
                    child: Rooms(onlineUsers: state.users),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                  sliver: SliverToBoxAdapter(
                    child: Stories(
                      stories: state.stories,
                      currentUser: state.currentUser,
                      onlineUsers: state.users,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final Post post = state.posts[index];
                      return PostContainer(post: post);
                    },
                    childCount: state.posts.length,
                  ),
                ),
              ],
            ),
            desktop: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: MoreOptionsList(currentUser: state.currentUser),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 600,
                  child: CustomScrollView(
                    controller: _trackingScrollController,
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                        sliver: SliverToBoxAdapter(
                          child: Stories(
                            stories: state.stories,
                            currentUser: state.currentUser,
                            onlineUsers: state.users,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CreatePostWidget(
                          currentUser: state.currentUser,
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        sliver: SliverToBoxAdapter(
                          child: Rooms(onlineUsers: state.users),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final Post post = state.posts[index];
                            return PostContainer(post: post);
                          },
                          childCount: state.posts.length,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ContactsList(users: state.users),
                  ),
                ),
              ],
            ),
          ),
        );
      }
      return Scaffold();
    });
  }
}
