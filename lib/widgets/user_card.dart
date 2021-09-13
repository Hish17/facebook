import 'package:facebook/models/user.dart';
import 'package:facebook/widgets/profileAvatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(
            user: user,
          ),
          SizedBox(width: 6),
          Text(
            user.name,
          )
        ],
      ),
    );
  }
}
