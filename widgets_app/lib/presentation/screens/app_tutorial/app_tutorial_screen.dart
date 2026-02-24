import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageurl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageurl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    imageurl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Entrega rapida',
    caption:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    imageurl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Disfruta la comida',
    caption:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    imageurl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatelessWidget {
  static const String nameRoute = 'app_tutorial';

  const AppTutorialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageurl,
                  ),
                )
                .toList(),
          ),
          // Boton de skip
          Positioned(
            top: 50,
            right: 30,
            child: TextButton(
              child: const Text('Skip'),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
