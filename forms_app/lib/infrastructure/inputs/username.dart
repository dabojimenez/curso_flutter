import 'package:formz/formz.dart';

// Define input validation errors
// definimos los errores que vamos a manejar, que sera el vacio y el largo
// enumeracion d elos errores a manejar
enum UsernameError { empty, length }

// Extend FormzInput and provide the input type and error type.
// Username: es el nombre del input que vamos a manejar
class Username extends FormzInput<String?, UsernameError> {
  // Call super.pure to represent an unmodified form input.
  // definimos el valor inicial, cuando se crea el input
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  // es la forma como quieren que cambien el valor ya sea posicionale so obligatorios
  // se llama cuando, el cmapo es alterado por el usuario
  const Username.dirty({String? value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  // validaciones a ejecutarse
  @override
  UsernameError? validator(String? value) {
    if (value == null) return UsernameError.empty;
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if (value.length < 6) return UsernameError.length;

    return null;
  }
}
