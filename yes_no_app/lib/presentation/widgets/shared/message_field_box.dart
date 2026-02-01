import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;

    // Elemento, el cual nos va a dar control sobre el input, al cual se va asociar
    final textControll = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      filled: true,
      hintText: 'End your message with a "?"',
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textControll.value.text;
          print('Valor de la caja de texto: $textValue');
          textControll.clear();
        },
      ),
    );

    return TextFormField(
      // Para que cuando de fuera del texto, se desabilite o se oculte el texto
      // onTapOutside: (event) {
      //   focusNode.unfocus();
      // },
      focusNode: focusNode,
      controller: textControll,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value $value');
        textControll.clear();
        focusNode.requestFocus();
      },
      // onChanged: (value) {
      //   print('Change: $value');
      // },
    );
  }
}
