import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider: pequeña piesa de informacion de estado de la aplicacion
final counterProvider = StateProvider.autoDispose<int>((ref) => 5);