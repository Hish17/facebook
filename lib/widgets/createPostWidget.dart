import 'package:facebook/models/user.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CreatePostWidget extends StatelessWidget {
  final User currentUser;
  CreatePostWidget({
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 100.0,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    // backgroundColor: Colors.grey,
                    backgroundImage:
                        CachedNetworkImageProvider(currentUser.imageUrl),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                          hintText: 'What\'s on your mind?'),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              color: Colors.grey,
            ),
            Container(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      Text('Live'),
                    ],
                  ),
                  VerticalDivider(
                    width: 20,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.photo_album,
                        color: Colors.green,
                      ),
                      Text('Photo'),
                    ],
                  ),
                  VerticalDivider(
                    width: 20,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.videocam,
                        color: Colors.purple,
                      ),
                      Text('Room'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
