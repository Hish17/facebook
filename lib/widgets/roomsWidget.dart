import 'package:facebook/models/user.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';

import 'onlineUserAvatar.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({
    required this.onlineUsers,
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
        height: 60,
        color: Colors.white,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[100],
                    ),
                    onPressed: () {},
                    child: Text(
                      'Create Room',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
              return OnlineUserAvatar(onlineUser: onlineUsers[index]);
            }),
      ),
    );
  }
}
