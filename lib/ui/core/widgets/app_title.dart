import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Theme.of(context).colorScheme.onSurface,
            borderRadius: BorderRadius.circular(4),
          ),
          width: 36,
          height: 36,
          alignment: Alignment.center,
          child: Text(
            'Y',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        SizedBox(width: 6),
        Text(
          ':\\',
          style: TextStyle(
            letterSpacing: 4,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(140),
          ),
        ),
        Text('TANGERINE', style: TextStyle(letterSpacing: 4)),
      ],
    );
  }
}
