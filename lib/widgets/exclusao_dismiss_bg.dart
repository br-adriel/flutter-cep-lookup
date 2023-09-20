import 'package:flutter/material.dart';

class ExclusaoDismissBg extends StatelessWidget {
  const ExclusaoDismissBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[600],
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.delete_rounded, color: Colors.white),
          SizedBox(width: 16)
        ],
      ),
    );
  }
}
