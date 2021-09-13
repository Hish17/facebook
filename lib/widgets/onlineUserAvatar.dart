import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/models/user.dart';
import 'package:flutter/material.dart';

class OnlineUserAvatar extends StatelessWidget {
  const OnlineUserAvatar({
    Key? key,
    required this.onlineUser,
  }) : super(key: key);

  final User onlineUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(5, 9, 5, 5),
          child: CircleAvatar(
            backgroundColor: Colors.red,
            backgroundImage: CachedNetworkImageProvider(onlineUser.imageUrl),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 9,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(32, 32, 0, 0),
          child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: 7,
          ),
        ),
      ],
    );
  }
}
