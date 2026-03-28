import 'package:formz/formz.dart';

// Define input validation errors
// definimos los errores que vamos a manejar, que sera el vacio y el largo
// enumeracion d elos errores a manejar
enum PasswordError { empty, length }

// Extend FormzInput and provide the input type and error type.
// Password: es el nombre del input que vamos a manejar
class Password extends FormzInput<String?, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  // definimos el valor inicial, cuando se crea el input
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  // es la forma como quieren que cambien el valor ya sea posicionale so obligatorios
  // se llama cuando, el cmapo es alterado por el usuario
  const Password.dirty({String? value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordError.empty) return 'El campo es requerido';
    if (displayError == PasswordError.length) return 'Mínimo 6 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  // validaciones a ejecutarse
  @override
  PasswordError? validator(String? value) {
    if (value == null) return PasswordError.empty;
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 6) return PasswordError.length;

    return null;
  }
}
