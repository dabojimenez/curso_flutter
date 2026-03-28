import 'package:flutter/material.dart';

class CustomTextFormFiel extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorMessage;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomTextFormFiel({
    super.key,
    this.label,
    this.hintText,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      // borderSide: BorderSide(color: Colors.blue),
    );

    return TextFormField(
      // obscureText: true, // usado para contraseñas, ya que no muestra el texto
      onChanged: onChanged,
      // validator: para validar el campo
      validator: validator,
      // decoration: nos pemrite personalizar el campo, en su estilo
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.blue),
        ),

        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hintText,
        focusColor: Colors.blue,
        errorText: errorMessage,
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
