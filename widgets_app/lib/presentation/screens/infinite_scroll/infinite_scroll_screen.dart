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