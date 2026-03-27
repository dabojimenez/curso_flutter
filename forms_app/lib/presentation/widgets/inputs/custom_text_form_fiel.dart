import 'package:flutter/material.dart';

class CustomTextFormFiel extends StatelessWidget {
  const CustomTextFormFiel({super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      // borderSide: BorderSide(color: Colors.blue),
    );

    return TextFormField(
      // obscureText: true, // usado para contraseñas, ya que no muestra el texto
      onChanged: (value) {
        print(value);
      },
      // validator: para validar el campo
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo requerido';
        }
        return null;
      },
      // decoration: nos pemrite personalizar el campo, en su estilo
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
