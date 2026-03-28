import 'package:formz/formz.dart';

// Define input validation errors
// definimos los errores que vamos a manejar, que sera el vacio y el largo
// enumeracion d elos errores a manejar
enum EmailError { empty, format }

// Extend FormzInput and provide the input type and error type.
// Email: es el nombre del input que vamos a manejar
class Email extends FormzInput<String?, EmailError> {
  static final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Call super.pure to represent an unmodified form input.
  // definimos el valor inicial, cuando se crea el input
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  // es la forma como quieren que cambien el valor ya sea posicionale so obligatorios
  // se llama cuando, el cmapo es alterado por el usuario
  const Email.dirty({String? value = ''}) : super.dirty(value);

  // getter, par aobtener los mensajes de error
  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EmailError.empty) return 'El campo es requerido';
    if (displayError == EmailError.format)
      return 'No tiene formato de correo electronico';

    return null;
  }

  // Override validator to handle validating a given input value.
  // validaciones a ejecutarse
  @override
  EmailError? validator(String? value) {
    if (value == null) return EmailError.empty;
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;

    if (!emailRegExp.hasMatch(value)) return EmailError.format;

    return null;
  }
}
