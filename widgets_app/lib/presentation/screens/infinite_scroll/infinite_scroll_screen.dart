import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const String nameRoute = 'infinite_scroll';

  const InfiniteScrollScreen({Key? key}) : super(key: key);

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() { 
    super.initState();
    scrollController.addListener(() {
      //determinamos si estamos al final de la lista
      // maxScrollExtent: es lo maximo que puede llefar el scroll
      // pixels: posicion donde nos encontramos
      if( (scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        // load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() { 
    scrollController.dispose();
    // para evitar sobre cargo en la pila de presentacion de los gitgets
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {

    if (isLoading) return;
    isLoading = true;

    setState(() {
      
    });

    await Future.delayed(const Duration(seconds: 2));

    addFileImages();
    isLoading = false;

    // TODO: Revisar si esta montado el componente / widget
    // si no esta montado, no hacemos nada
    if(!isMounted) return;
    setState(() {
    });
  }

  void addFileImages(){
    final lastId = imagesIds.last;
    // barremos cada uno de los elemtnos y sumamos 1 a cada uno
    imagesIds.addAll(
      [1,2,3,4,5, 6,7,8,9,10].map( (e) => lastId + e)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text('Infinite Scroll'),
      // ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true, // Removemos la aprte superior, que por si acaso se dese mostrar algo en la parte superior (usado por el appbar)
        removeBottom: true,
        child: ListView.builder(
          controller: scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (context, index){
            return FadeInImage(
              width: double.infinity ,
              height: 300,
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/images/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: (){
          context.pop();
        },
      ),
    );
  }
}