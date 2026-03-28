import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../infrastructure/inputs/inputs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(RegisterFormState());

  void onSumit() {
    // onemos al formulario en un estado nuevo
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        username: Username.dirty(value: state.username.value),
        password: Password.dirty(value: state.password.value),
        isValid: Formz.validate([
          state.username,
          state.password,
          // TODO: state.email
        ]),
      ),
    );
    print('Cubit sumit $state');
  }

  void usernameChanged(String? value) {
    // aqui creamos una nueva isntancia y con todas su validaciones
    final username = Username.dirty(value: value);
    // Formz.validate: al llamaro asi, pide el listado de data, de tipo forminput y llamada su cada validacion, para saber si es o no es valido
    emit(
      state.copyWith(
        username: username,
        // por q enviamos los demas campos ?, para que se validen y regrese si son o no  es valido el fomrulario
        isValid: Formz.validate([username, state.password]),
      ),
    );
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value: value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username]),
      ),
    );
  }
}
