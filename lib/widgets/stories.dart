import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook/models/story.dart';
import 'package:facebook/models/user.dart';
import 'package:facebook/widgets/responsive.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<User> onlineUsers;
  final List<Story> stories;
  const Stories({
    Key? key,
    required this.stories,
    required this.currentUser,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image(
                        image: CachedNetworkImageProvider(
                          currentUser.imageUrl,
                        ),
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: 110,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        child: Container(
                          color: Colors.grey[300],
                          height: 60,
                          width: 110,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 30,
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: CircleAvatar(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            'Create\n Story',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Image(
                      image: CachedNetworkImageProvider(
                        stories[index].imageUrl,
                      ),
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: 110,
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 23,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 20.0,
                          // backgroundColor: Colors.grey,
                          backgroundImage: CachedNetworkImageProvider(
                              stories[index].user.imageUrl),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 4,
                    bottom: 5,
                    child: Text(
                      stories[index].user.name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
