import 'package:flutter/material.dart';
import 'package:toktik/domain/repositories/video_post_repositorie.dart';
import 'package:toktik/domain/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    final List<VideoPost> newVideos = await videoPostRepository
        .getTrendingVideosByPage(1);

    videos.addAll(newVideos);

    initialLoading = false;

    notifyListeners();
  }
}
