import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ..: es un operador de cascada, que nos permite apuntar al objeto raiz de forma indircta
        // pero perdemos la referencia al objeto original, por lo que no podemos acceder a sus metodos
        // ChangeNotifierProvider: tiene carga perezosa por defecto
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => 
          DiscoverProvider()
          ..loadNextPage()
          ),
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}
