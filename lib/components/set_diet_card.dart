import 'package:flutter/material.dart';

class SetDietCard extends StatelessWidget {
  const SetDietCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.onPressed});
  final String imageUrl;
  final String title;
  final String subtitle;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
              radius: 30.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text left
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  Text(subtitle),
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            IconButton(
              icon: Icon(icon),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
