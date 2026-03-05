import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider.autoDispose<bool>((ref) => false);

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// un simple entero
final selectedIndexColorProvider = StateProvider.autoDispose<int>((ref) => 0);

// Un objeto de tipoAppTheme (custom/personalizado)
// StateNotifierProvider: es un provider que se encarga de controlar el estado de un objeto
// ThemeNotifier: clase encargada de controlar los datos o el estado de AppTheme
// el segundo valor, es la instancia de AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);


// Controller o Notifier
// <AppTheme>: deifnimos la isntancia del apptheme
class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() 
  : super(AppTheme()); // crea una instancia de todos los valores que esten definidos en el apptheme | STATE = estado = new AppTheme();

  void toggleDarkMode(){
    // el nuevo estado, sera una copia del estado actual, pero con su valor contrario
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int index){
    state = state.copyWith(selectedColor: index);
  }

}