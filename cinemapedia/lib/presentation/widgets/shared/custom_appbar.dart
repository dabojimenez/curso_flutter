import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity, // todo el anchoq ue se pueda
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text('Cinemapedia', style: titleStyle),
              // Spacer: es como un espacio flexible que ocupa todo el espacio restante
              Spacer(),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // showSearch: muestra un buscador en pantalla completa
                  showSearch(
                    context: context,
                    // delegate: el encargado de manejar la logica del buscador y esta relacionado a la capa de presentacion
                    delegate: SearchMovieDelegate(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
