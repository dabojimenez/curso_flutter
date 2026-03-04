import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // Nos permitira cual de las opciones del menu estan seleccionadas
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      // Este metodo se ejecutara cada vez que se seleccione una opcion del menu
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
      },
      children: [
        NavigationDrawerDestination(
          icon: Icon(Icons.add),
          label: Text('Botones'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.add_shopping_cart),
          label: Text('Botones'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.qr_code),
          label: Text('Botones'),
        ),
      ],
    );
  }
}
