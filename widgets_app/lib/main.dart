import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(
    // con esto ya sabra donde poder bsucar los providers que se vayan creando
    ProviderScope(
      child: MainApp()
    )
    // const MainApp()
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter widgets',
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 4).getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
