import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:facebook/models/post.dart';
import 'package:facebook/widgets/profileAvatar.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: isDesktop ? 5.0 : 0.0,
      ),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PostHeader(
              post: post,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(post.caption),
            ),
            post.images == null
                ? Container()
                : post.images!.length == 1
                    ? CachedNetworkImage(
                        imageUrl: post.images![0],
                      )
                    : CarouselSlider.builder(
                        itemCount: post.images!.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            CachedNetworkImage(
                          imageUrl: post.images![itemIndex],
                        ),
                        options: CarouselOptions(
                          autoPlay: false,
                          // enlargeCenterPage: true,
                        ),
                      ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStates(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ProfileAvatar(user: post.user),
      // const SizedBox(
      //   width: 8,
      // ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  post.user.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.more_horiz)
              ],
            ),
            Row(
              children: [
                Text(
                  post.timeAgo + " . ",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                Icon(
                  Icons.public,
                  color: Colors.grey[600],
                  size: 12,
                ),
              ],
            ),
          ],
        ),
      ),
      // Icon(Icons.more_horiz),
    ]);
  }
}

class _PostStates extends StatelessWidget {
  final Post post;
  const _PostStates({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(1, 3, 2, 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 7,
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.white,
                      size: 10,
                    ),
                  ),
                  Text('${post.likes} '),
                ],
              ),
              Row(
                children: [
                  Text('${post.comments} comments'),
                  SizedBox(width: 5),
                  Text('${post.shares} shares'),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
                icon: Icon(
                  Icons.thumb_up_alt_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
                label: 'Like',
                onTap: () {}),
            _PostButton(
                icon: Icon(
                  Icons.comment_bank_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
                label: 'Comment',
                onTap: () {}),
            _PostButton(
                icon: Icon(
                  Icons.share_outlined,
                  color: Colors.grey,
                  size: 20,
                ),
                label: 'Share',
                onTap: () {}),
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;
  const _PostButton(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4,
                ),
                Text(label)
              ],
            ),
          ),
          onTap: () => onTap,
        ),
      ),
    );
  }
}
