import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/models/user.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircleAvatar(
        radius: 20.0,
        // backgroundColor: Colors.grey,
        backgroundImage: CachedNetworkImageProvider(
          user.imageUrl,
        ),
      ),
    );
  }
}
