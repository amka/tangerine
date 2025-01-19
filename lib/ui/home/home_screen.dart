import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

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
