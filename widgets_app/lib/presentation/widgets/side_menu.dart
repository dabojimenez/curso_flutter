import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

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
    // viewPadding: nos permite saber si la pantalla tiene una notchi (es decir, si la pantalla tiene una barra de notificaciones)
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      // Este metodo se ejecutara cada vez que se seleccione una opcion del menu
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
      },
      children: [
        Padding(
          // uun pequeño arreglo, para los ios y androids
          padding: EdgeInsetsGeometry.fromLTRB(20, hasNotch ? 10 : 25, 16, 10),
          child: Text('Bienvenido: David !!!'),
        ),

        ...appMenuItems
            .sublist(0, 3) // tendremos los primeros 3 elementos
            .map(
              (e) => NavigationDrawerDestination(
                icon: Icon(e.icon),
                label: Text(e.title),
              ),
            ),

        Padding(
          padding: const EdgeInsetsGeometry.fromLTRB(28, 16, 28, 10),
          child: Divider(), // Genera una linea de divicion
        ),
        
        Padding(
          padding: const EdgeInsetsGeometry.fromLTRB(28, 16, 28, 10),
          child: Text('Mas opciones'),
        ),

        ...appMenuItems
            .sublist(3) // tendremos los primeros 3 elementos
            .map(
              (e) => NavigationDrawerDestination(
                icon: Icon(e.icon),
                label: Text(e.title),
              ),
            ),
      ],
    );
  }
}
