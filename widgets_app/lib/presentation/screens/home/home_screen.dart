import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      // physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItems = appMenuItems[index];
        return _CustomListTitle(menuItems: menuItems);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItems,
  });

  final MenuItems menuItems;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItems.icon, color: theme.primary,),
      trailing: Icon(Icons.arrow_forward_ios_sharp, color: theme.primary,),
      title: Text(menuItems.title),
      subtitle: Text(menuItems.subtitle),
      onTap: () {
        // TODO: Navegar a otra pantalla
      },
    );
  }
}
