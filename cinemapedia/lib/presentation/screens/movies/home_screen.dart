import 'package:flutter/material.dart';

import '../../views/views.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(), // Para el de categorias (provicional ya que aun no tenemos un widget)
    FavoriteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack: nos pemrite mantener el estado de la pagina
      body: IndexedStack(children: viewRoutes),
      bottomNavigationBar: CustomButtomNavigationbar(),
    );
  }
}
