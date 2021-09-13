import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  CircleButton({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
