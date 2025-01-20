import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../core/widgets/app_title.dart';
import '../core/widgets/item_list_tile.dart';
import '../../data/models/item.dart';
import '../../data/repository/item_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final itemRepo = ItemRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTitle(),
            Row(
              children: [
                IconButton(
                  icon: Icon(HugeIcons.strokeRoundedPlusSign),
                  onPressed: () {},
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        toolbarHeight: 80,
      ),
      body: FutureBuilder(
        future: itemRepo.fetchTopIds(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final itemId = snapshot.data![index];
                return FutureBuilder(
                  future: itemRepo.fetchItem(itemId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data != null) {
                        final item = snapshot.data as Item;
                        return ItemListTile(item: item);
                      } else {
                        return SizedBox.shrink();
                      }
                    } else {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }
                  },
                );
              },
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
        },
      ),
    );
  }
}
