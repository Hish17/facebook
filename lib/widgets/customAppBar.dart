import 'package:facebook/models/user.dart';
import 'package:facebook/widgets/customTabBar.dart';
import 'package:facebook/widgets/user_card.dart';
import 'package:flutter/material.dart';

import 'circleButton.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  const CustomAppBar({
    Key? key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 20.0),
      // height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.facebook,
                  size: 60,
                  color: Colors.blue,
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 30,
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Facebook',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
              isBottomIndicator: true,
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // UserCard(
                //   user: currentUser,
                // ),
                const SizedBox(
                  width: 12.0,
                ),
                CircleButton(
                  icon: Icons.grid_view_rounded,
                ),
                CircleButton(
                  icon: Icons.message,
                ),
                CircleButton(
                  icon: Icons.notifications,
                ),
                CircleButton(
                  icon: Icons.arrow_drop_down,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
