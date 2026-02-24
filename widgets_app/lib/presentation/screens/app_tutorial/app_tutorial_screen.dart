import 'package:flutter/material.dart';

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
      body: PageView(
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
    return Container(child: null);
  }
}
