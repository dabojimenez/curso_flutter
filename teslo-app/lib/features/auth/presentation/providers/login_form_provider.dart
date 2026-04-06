//! 1 - State del provider
import 'package:flutter_riverpod/legacy.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop/features/shared/shared.dart';

class LoginFormsState {
  final bool isPosting;
  final bool ifFormPosted;
  final bool isValid;
  final Email email;
  final Password password;

  LoginFormsState(
      {this.isPosting = false,
      this.ifFormPosted = false,
      this.isValid = false,
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  LoginFormsState copyWith({
    bool? isPosting,
    bool? ifFormPosted,
    bool? isValid,
    Email? email,
    Password? password,
  }) {
    return LoginFormsState(
      isPosting: isPosting ?? this.isPosting,
      ifFormPosted: ifFormPosted ?? this.ifFormPosted,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() => '''
  isPosting: $isPosting
  ifFormPosted: $ifFormPosted
  isValid: $isValid
  email: $email
  password: $password
''';
}

//! 2 - Como implementamos un notifier
class LoginFormNotifier extends StateNotifier<LoginFormsState> {
  LoginFormNotifier() : super(LoginFormsState());

  onEmailChange(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(
      email: email,
      isValid: Formz.validate([email, state.password]),
    );
  }

  onPasswordChange(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password,
      isValid: Formz.validate([state.email, password]),
    );
  }

  onFormSubmit() {
    _touchEveryField();

    // Si el formulario no es válido, no se hace nada
    if (!state.isValid) return;

    print(state);
  }

  // Tocamos todos los campos del formulario, para aplicar las validaciones y mostrar los errores
  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
      email: email,
      password: password,
      isValid: Formz.validate([email, password]),
      ifFormPosted: true,
    );
  }
}

//! 3 - StateNotifierprovider - consume afuera
final LoginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormsState>(
        (ref) {
  return LoginFormNotifier();
});
