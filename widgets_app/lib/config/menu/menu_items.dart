import 'package:flutter/material.dart' show IconData, Icons;

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Botones',
    subtitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: 'Progress Indicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: 'Snackbars y Dialogos',
    subtitle: 'Indicadores en la pantalla',
    link: '/snackbar',
    icon: Icons.info_outlined,
  ),
  MenuItems(
    title: 'Animated container',
    subtitle: 'Un ejemplo de animación',
    link: '/animated_container',
    icon: Icons.check_box_outlined,
  ),
  MenuItems(
    title: 'Ui Controls + Tiles',
    subtitle: 'Una serie de controles de flutter',
    link: '/ui-controls',
    icon: Icons.switch_access_shortcut_outlined,
  ),
  MenuItems(
    title: 'Tutorial',
    subtitle: 'Tutorial de la aplicacion',
    link: '/tutorial',
    icon: Icons.accessibility_rounded,
  ),
];
