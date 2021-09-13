import 'package:facebook/models/user.dart';
import 'package:facebook/widgets/user_card.dart';
import 'package:flutter/material.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [Icons.shield, Colors.deepPurple, 'COVID-19 Info Center'],
    [Icons.people, Colors.cyan, 'Friends'],
    [Icons.message, Colors.blue, 'Messenger'],
    [Icons.flag, Colors.orange, 'Pages'],
    [Icons.store, Colors.blue, 'Marketplace'],
    [Icons.ondemand_video, Colors.blue, 'Watch'],
    [Icons.calendar_today, Colors.red, 'Events'],
  ];

  final User currentUser;

  const MoreOptionsList({
    required this.currentUser,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
        itemCount: 1 + _moreOptionsList.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: UserCard(user: currentUser),
            );
          }
          final List option = _moreOptionsList[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _Option(
              icon: option[0],
              color: option[1],
              label: option[2],
            ),
          );
        },
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _Option({
    required this.icon,
    required this.color,
    required this.label,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(icon, size: 38.0, color: color),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
