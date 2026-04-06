//! 1 - State del provider
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
}
//! 2 - Como implementamos un notifier

//! 3 - StateNotifierprovider - consume afuera
