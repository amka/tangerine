import 'package:flutter/material.dart';

import '../../../data/models/item.dart';

class ItemListTile extends StatelessWidget {
  final Function()? onTap;
  final Function()? onLongTap;

  const ItemListTile({
    super.key,
    required this.item,
    this.onTap,
    this.onLongTap,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      onLongPress: onLongTap,
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(4),
        ),
        width: 36,
        height: 36,
        alignment: Alignment.center,
        child: Text(
          '${item.score}',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 14,
          ),
          overflow: TextOverflow.fade,
        ),
      ),
      title: Text(item.title),
      subtitle: Text(
        item.url,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
        ),
      ),
    );
  }
}
